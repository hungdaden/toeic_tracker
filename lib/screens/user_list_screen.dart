import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import 'main_screen.dart';
import 'edit_user_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../services/storage_service.dart';
import '../widgets/skills_toggle.dart';

import '../providers/auth_provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  void _openAddUserDialog() {
    showDialog(context: context, builder: (context) => const AddUserDialog());
  }

  void _signOut() async {
    await context.read<AuthProvider>().signOut();
    if (!mounted) return;
    // Quay về HomeScreen sau khi đăng xuất
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen(initialIndex: 0)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn Hồ Sơ Học Tập'),
        // Xóa nút back (leading) vì giờ màn hình này là 1 tab trong thanh điều hướng
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Đăng xuất',
            onPressed: _signOut,
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.users.isEmpty) {
            return const Center(
              child: Text(
                'Chưa có hồ sơ học tập nào.\nHãy tạo mới để bắt đầu!',
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              final user = provider.users[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: user.avatarUrl != null
                        ? NetworkImage(user.avatarUrl!)
                        : null,
                    child: user.avatarUrl == null
                        ? Text(
                            user.name.isNotEmpty
                                ? user.name[0].toUpperCase()
                                : '?',
                            style: const TextStyle(fontSize: 20),
                          )
                        : null,
                  ),
                  title: Text(
                    user.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Ngày sinh: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}',
                  ),
                  trailing: const Icon(Icons.login),
                  onTap: () {
                    provider.setCurrentUser(user);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen(initialIndex: 1)),
                      (route) => false,
                    );
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text('Tùy Chọn Hồ Sơ'),
                        content: Text(
                          'Bạn muốn làm gì với hồ sơ của ${user.name}?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(c);
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    EditUserDialog(user: user),
                              );
                            },
                            child: const Text('Chỉnh sửa'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(c);
                              showDialog(
                                context: context,
                                builder: (d) => AlertDialog(
                                  title: const Text('Xóa hồ sơ?'),
                                  content: Text(
                                    'Bạn có chắc muốn xóa hồ sơ của ${user.name}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(d),
                                      child: const Text('Hủy'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        provider.deleteUser(user.id);
                                        Navigator.pop(d);
                                      },
                                      child: const Text(
                                        'Xóa',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text(
                              'Xóa',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddUserDialog,
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm Hồ Sơ'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key});

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final _formKey = GlobalKey<FormState>();

  // Tạo sẵn ID cho user mới để gán cho tên ảnh trên Firebase
  final String _newUserId = DateTime.now().millisecondsSinceEpoch.toString();

  String _name = '';
  int _targetScore = 500;
  DateTime _dob = DateTime.now();
  bool _isFourSkills = false;

  String? _avatarUrl; // Đổi thành avatarUrl
  bool _isUploading = false; // Thêm trạng thái loading

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => _isUploading = true);

      Uint8List imageBytes = await image.readAsBytes();

      StorageService storageService = StorageService();

      String? downloadUrl = await storageService.uploadAvatar(
        imageBytes,
        _newUserId,
      );

      setState(() {
        _isUploading = false;
        if (downloadUrl != null) {
          _avatarUrl = downloadUrl; // Gán link web
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Lỗi tải ảnh lên!')));
        }
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_isUploading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đang tải ảnh lên, vui lòng chờ...')),
        );
        return;
      }

      _formKey.currentState!.save();
      final user = UserModel(
        id: _newUserId, // Dùng ID đã tạo ở trên
        name: _name,
        targetScore: _targetScore,
        dateOfBirth: _dob,
        avatarUrl: _avatarUrl, // Lưu link web
        isFourSkills: _isFourSkills,
      );
      context.read<UserProvider>().addUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int maxScore = _isFourSkills ? 1390 : 990;
    
    return AlertDialog(
      title: const Text('Tạo Hồ Sơ Mới'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _isUploading ? null : _pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(51),
                  // Dùng NetworkImage
                  backgroundImage: _avatarUrl != null
                      ? NetworkImage(_avatarUrl!)
                      : null,
                  // Hiện loading nếu đang upload
                  child: _isUploading
                      ? const CircularProgressIndicator()
                      : (_avatarUrl == null
                            ? const Icon(Icons.add_a_photo, size: 30)
                            : null),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tên hiển thị'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Vui lòng nhập tên' : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 16),
              SkillsToggle(
                isFourSkills: _isFourSkills,
                onChanged: (bool value) {
                  setState(() {
                    _isFourSkills = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: ValueKey('aim_$_isFourSkills'),
                initialValue: _targetScore.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Mức Aim (Mục tiêu)',
                  suffixText: 'điểm',
                  helperText: 'Tối đa $maxScore điểm',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Vui lòng nhập Mức Aim';
                  final score = int.tryParse(val);
                  if (score == null || score < 0 || score > maxScore)
                    return 'Aim không hợp lệ (0-$maxScore)';
                  return null;
                },
                onSaved: (val) => _targetScore = int.parse(val!),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Ngày sinh: ${DateFormat('dd/MM/yyyy').format(_dob)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _dob,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _dob = picked);
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: _isUploading ? null : _save,
          child: const Text('Lưu & Tạo'),
        ),
      ],
    );
  }
}

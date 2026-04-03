import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import 'main_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  void _openAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddUserDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn Hồ Sơ Học Tập'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
             return const Center(child: CircularProgressIndicator());
          }
          if (provider.users.isEmpty) {
            return const Center(
              child: Text('Chưa có hồ sơ học tập nào.\nHãy tạo mới để bắt đầu!', textAlign: TextAlign.center),
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
                    backgroundImage: user.avatarPath != null ? FileImage(File(user.avatarPath!)) : null,
                    child: user.avatarPath == null ? Text(user.name.isNotEmpty ? user.name[0].toUpperCase() : '?', style: const TextStyle(fontSize: 20)) : null,
                  ),
                  title: Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  subtitle: Text('Ngày sinh: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}'),
                  trailing: const Icon(Icons.login),
                  onTap: () {
                    provider.setCurrentUser(user);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen()));
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text('Xóa hồ sơ?'),
                        content: Text('Bạn có chắc muốn xóa hồ sơ của ${user.name}?'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Hủy')),
                          TextButton(onPressed: () {
                            provider.deleteUser(user.id);
                            Navigator.pop(c);
                          }, child: const Text('Xóa', style: TextStyle(color: Colors.red))),
                        ],
                      )
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
  String _name = '';
  DateTime _dob = DateTime.now();
  String? _avatarPath;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _avatarPath = image.path;
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _name,
        dateOfBirth: _dob,
        avatarPath: _avatarPath,
      );
      context.read<UserProvider>().addUser(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tạo Hồ Sơ Mới'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(51),
                  backgroundImage: _avatarPath != null ? FileImage(File(_avatarPath!)) : null,
                  child: _avatarPath == null ? const Icon(Icons.add_a_photo, size: 30) : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tên hiển thị'),
                validator: (val) => val == null || val.isEmpty ? 'Vui lòng nhập tên' : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Ngày sinh: ${DateFormat('dd/MM/yyyy').format(_dob)}'),
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
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
        ElevatedButton(onPressed: _save, child: const Text('Lưu & Tạo')),
      ],
    );
  }
}

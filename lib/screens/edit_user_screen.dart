import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
// QUAN TRỌNG: Đảm bảo bạn đã import đúng đường dẫn tới file storage_service của bạn
import '../services/storage_service.dart';

class EditUserDialog extends StatefulWidget {
  final UserModel user;

  const EditUserDialog({super.key, required this.user});

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _targetScore;
  late DateTime _dob;

  // 1. Đổi tên biến sang avatarUrl và thêm trạng thái loading
  String? _avatarUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _targetScore = widget.user.targetScore;
    _dob = widget.user.dateOfBirth;

    // Đọc link ảnh từ data cũ (nhớ đảm bảo UserModel đã dùng avatarUrl)
    _avatarUrl = widget.user.avatarUrl;
  }

  // 2. Viết lại hàm chọn và tải ảnh lên mạng
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Bật hiệu ứng xoay tròn báo hiệu đang upload
      setState(() {
        _isUploading = true;
      });

      Uint8List imageBytes = await image.readAsBytes();

      StorageService storageService = StorageService();

      String? downloadUrl = await storageService.uploadAvatar(
        imageBytes,
        widget.user.id,
      );

      setState(() {
        _isUploading = false; // Tắt hiệu ứng xoay tròn
        if (downloadUrl != null) {
          _avatarUrl =
              downloadUrl; // Gán link Firebase trả về vào biến hiển thị
        } else {
          // Báo lỗi nếu việc upload thất bại (do mạng, do rules Firebase...)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Lỗi tải ảnh lên. Vui lòng thử lại.')),
          );
        }
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      // 3. Chặn người dùng bấm lưu nếu ảnh vẫn đang tải lên dở dang
      if (_isUploading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đang tải ảnh lên Firebase, vui lòng chờ...'),
          ),
        );
        return;
      }

      _formKey.currentState!.save();
      final updatedUser = UserModel(
        id: widget.user.id,
        authUid: widget.user.authUid, // Quan trọng: Giữ lại ID tài khoản
        name: _name,
        targetScore: _targetScore,
        dateOfBirth: _dob,
        avatarUrl: _avatarUrl,
        scores: widget.user.scores,
        chatHistory:
            widget.user.chatHistory, // Quan trọng: Giữ lại lịch sử chat
      );
      context.read<UserProvider>().updateUser(updatedUser);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chỉnh Sửa Hồ Sơ'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 4. Cập nhật giao diện vòng tròn Avatar
              GestureDetector(
                onTap: _isUploading
                    ? null
                    : _pickImage, // Khóa bấm khi đang upload
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(51),
                  // Đổi từ FileImage sang NetworkImage để lấy ảnh từ internet
                  backgroundImage: _avatarUrl != null
                      ? NetworkImage(_avatarUrl!)
                      : null,
                  // Hiện vòng loading nếu đang up, hiện icon camera nếu chưa có ảnh
                  child: _isUploading
                      ? const CircularProgressIndicator()
                      : (_avatarUrl == null
                            ? const Icon(Icons.add_a_photo, size: 30)
                            : null),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Tên hiển thị'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Vui lòng nhập tên' : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _targetScore.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mức Aim (Mục tiêu)',
                  suffixText: 'điểm',
                ),
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Vui lòng nhập Mức Aim';
                  final score = int.tryParse(val);
                  if (score == null || score < 0 || score > 990)
                    return 'Aim không hợp lệ (0-990)';
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
          onPressed: _isUploading ? null : _save, // Khóa nút khi đang upload
          child: const Text('Lưu thay đổi'),
        ),
      ],
    );
  }
}

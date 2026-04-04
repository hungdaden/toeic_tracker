import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

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
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _targetScore = widget.user.targetScore;
    _dob = widget.user.dateOfBirth;
    _avatarPath = widget.user.avatarPath;
  }

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
      final updatedUser = UserModel(
        id: widget.user.id,
        name: _name,
        targetScore: _targetScore,
        dateOfBirth: _dob,
        avatarPath: _avatarPath,
        scores: widget.user.scores,
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
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Tên hiển thị'),
                validator: (val) => val == null || val.isEmpty ? 'Vui lòng nhập tên' : null,
                onSaved: (val) => _name = val!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _targetScore.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Mức Aim (Mục tiêu)', suffixText: 'điểm'),
                validator: (val) {
                   if (val == null || val.isEmpty) return 'Vui lòng nhập Mức Aim';
                   final score = int.tryParse(val);
                   if (score == null || score < 0 || score > 990) return 'Aim không hợp lệ (0-990)';
                   return null;
                },
                onSaved: (val) => _targetScore = int.parse(val!),
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
        ElevatedButton(onPressed: _save, child: const Text('Lưu thay đổi')),
      ],
    );
  }
}

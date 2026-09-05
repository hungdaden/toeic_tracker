import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../services/storage_service.dart';
import '../widgets/skills_toggle.dart';
import '../widgets/dynamic_island_notification.dart';
import '../theme/liquid_glass_theme.dart';

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

  late bool _isFourSkills;

  String? _avatarUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _targetScore = widget.user.targetScore;
    _dob = widget.user.dateOfBirth;
    _isFourSkills = widget.user.isFourSkills;
    _avatarUrl = widget.user.avatarUrl;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
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
        _isUploading = false;
        if (downloadUrl != null) {
          _avatarUrl = downloadUrl;
        } else {
          DynamicIslandNotification.show(
            context,
            title: 'Lỗi',
            message: 'Lỗi tải ảnh lên. Vui lòng thử lại.',
            type: NotificationType.error,
          );
        }
      });
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_isUploading) {
        DynamicIslandNotification.show(
          context,
          title: 'Đang tải',
          message: 'Đang tải ảnh lên Firebase, vui lòng chờ...',
          type: NotificationType.info,
        );
        return;
      }

      _formKey.currentState!.save();
      final updatedUser = UserModel(
        id: widget.user.id,
        authUid: widget.user.authUid,
        name: _name,
        targetScore: _targetScore,
        dateOfBirth: _dob,
        avatarUrl: _avatarUrl,
        isFourSkills: _isFourSkills,
        scores: widget.user.scores,
        chatHistory: widget.user.chatHistory,
      );
      context.read<UserProvider>().updateUser(updatedUser);
      DynamicIslandNotification.show(
        context,
        title: 'Thành công',
        message: 'Đã cập nhật hồ sơ ${updatedUser.name}!',
        type: NotificationType.success,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int maxScore = _isFourSkills ? 1390 : 990;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: LiquidGlassContainer(
        borderRadius: 24,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Chỉnh Sửa Hồ Sơ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _isUploading ? null : _pickImage,
                  child: Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          LiquidGlassTheme.primaryAccent.withValues(alpha: 0.3),
                          LiquidGlassTheme.secondaryAccent.withValues(alpha: 0.1),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: ClipOval(
                      child: _isUploading
                          ? const Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            )
                          : (_avatarUrl != null
                              ? Image.network(_avatarUrl!, fit: BoxFit.cover)
                              : const Icon(Icons.add_a_photo_rounded, size: 28, color: Colors.white70)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: _name,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Tên hiển thị',
                    labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                    ),
                  ),
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
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Mức Aim (Mục tiêu)',
                    suffixText: 'điểm',
                    helperText: 'Tối đa $maxScore điểm',
                    labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
                    helperStyle: TextStyle(color: Colors.white.withValues(alpha: 0.45)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Vui lòng nhập Mức Aim';
                    }
                    final score = int.tryParse(val);
                    if (score == null || score < 0 || score > maxScore) {
                      return 'Aim không hợp lệ (0-$maxScore)';
                    }
                    return null;
                  },
                  onSaved: (val) => _targetScore = int.parse(val!),
                ),
                const SizedBox(height: 16),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                  ),
                  title: Text(
                    'Ngày sinh: ${DateFormat('dd/MM/yyyy').format(_dob)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(Icons.calendar_today_rounded, color: Colors.white70, size: 20),
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
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Hủy', style: TextStyle(color: Colors.white70)),
                    ),
                    const SizedBox(width: 8),
                    GlassButtonV2(
                      title: 'Lưu thay đổi',
                      onTap: _isUploading ? null : _save,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

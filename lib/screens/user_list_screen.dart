import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:may_uikit/may_uikit.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import 'main_screen.dart';
import 'edit_user_screen.dart';
import '../services/storage_service.dart';
import '../widgets/skills_toggle.dart';
import '../widgets/dynamic_island_notification.dart';
import '../providers/auth_provider.dart';
import '../theme/liquid_glass_theme.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openAddUserDialog() {
    showDialog(context: context, builder: (context) => const AddUserDialog());
  }

  void _signOut() async {
    await context.read<AuthProvider>().signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen(initialIndex: 0)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LiquidGlassScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Hồ Sơ Học Tập'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Colors.white),
            tooltip: 'Đăng xuất',
            onPressed: _signOut,
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: GlassButtonV2(
          title: 'Thêm hồ sơ',
          icon: const Icon(Icons.person_add_rounded, size: 20, color: Colors.white),
          onTap: _openAddUserDialog,
        ),
      ),
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: LiquidGlassTheme.primaryAccent),
            );
          }
          if (provider.users.isEmpty) {
            return Center(
              child: LiquidGlassContainer(
                margin: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.people_outline_rounded, size: 48, color: Colors.white54),
                    const SizedBox(height: 12),
                    Text(
                      'Chưa có hồ sơ học tập nào.\nHãy tạo mới để bắt đầu học tập!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                    ),
                  ],
                ),
              ),
            );
          }

          final currentUserId = provider.currentUser?.id;

          return CommonScrollbarWithIosStatusBarTapDetectorV2(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 130),
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                final user = provider.users[index];
                final isCurrent = user.id == currentUserId;

                return PressableCardContainerV2(
                  margin: const EdgeInsets.only(bottom: 12),
                  borderRadius: 22,
                  padding: const EdgeInsets.all(16),
                  color: isCurrent
                      ? LiquidGlassTheme.primaryAccent.withValues(alpha: 0.14)
                      : Colors.white.withValues(alpha: 0.06),
                  borderColor: isCurrent
                      ? LiquidGlassTheme.primaryAccent.withValues(alpha: 0.5)
                      : Colors.white.withValues(alpha: 0.12),
                  borderWidth: 1.0,
                  onTap: () {
                    provider.setCurrentUser(user);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen(initialIndex: 1)),
                      (route) => false,
                    );
                  },
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isCurrent
                                ? LiquidGlassTheme.primaryAccent
                                : Colors.white.withValues(alpha: 0.25),
                            width: 1.5,
                          ),
                        ),
                        child: ClipOval(
                          child: user.avatarUrl != null
                              ? Image.network(
                                  user.avatarUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => _buildAvatarFallback(user.name),
                                )
                              : _buildAvatarFallback(user.name),
                        ),
                      ),
                      const SizedBox(width: 14),

                      // User Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    user.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isCurrent)
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.5),
                                        width: 0.8,
                                      ),
                                    ),
                                    child: const Text(
                                      'HIỆN TẠI',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Sinh nhật: ${DateFormat('dd/MM/yyyy').format(user.dateOfBirth)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.55),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Aim: ${user.targetScore} điểm',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: LiquidGlassTheme.emeraldAccent,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    user.isFourSkills ? '4 Kỹ năng' : '2 Kỹ năng',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white.withValues(alpha: 0.65),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Edit / Action Menu
                      IconButton(
                        icon: const Icon(Icons.more_vert_rounded, color: Colors.white60),
                        onPressed: () => _showUserOptions(context, provider, user),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showUserOptions(BuildContext context, UserProvider provider, UserModel user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => LiquidGlassContainer(
        margin: const EdgeInsets.all(16),
        borderRadius: 24,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_rounded, color: Colors.white70),
              title: const Text('Chỉnh sửa hồ sơ', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(ctx);
                showDialog(
                  context: context,
                  builder: (context) => EditUserDialog(user: user),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
              title: const Text('Xóa hồ sơ', style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.pop(ctx);
                _confirmDelete(context, provider, user);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, UserProvider provider, UserModel user) {
    showDialog(
      context: context,
      builder: (d) => AlertDialog(
        backgroundColor: LiquidGlassTheme.backgroundSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Xóa hồ sơ?'),
        content: Text('Bạn có chắc muốn xóa hồ sơ của ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(d),
            child: const Text('HỦY', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {
              provider.deleteUser(user.id);
              DynamicIslandNotification.show(
                context,
                title: 'Đã xóa hồ sơ',
                message: 'Đã xóa hồ sơ của ${user.name}',
                type: NotificationType.warning,
              );
              Navigator.pop(d);
            },
            child: const Text('XÓA', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarFallback(String name) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
  final String _newUserId = DateTime.now().millisecondsSinceEpoch.toString();

  String _name = '';
  int _targetScore = 500;
  DateTime _dob = DateTime.now();
  bool _isFourSkills = false;

  String? _avatarUrl;
  bool _isUploading = false;

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

      if (mounted) {
        setState(() {
          _isUploading = false;
          if (downloadUrl != null) {
            _avatarUrl = downloadUrl;
          } else {
            DynamicIslandNotification.show(
              context,
              title: 'Lỗi',
              message: 'Không thể tải ảnh lên!',
              type: NotificationType.error,
            );
          }
        });
      }
    }
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      if (_isUploading) {
        DynamicIslandNotification.show(
          context,
          title: 'Đang tải',
          message: 'Đang tải ảnh lên, vui lòng chờ...',
          type: NotificationType.info,
        );
        return;
      }

      _formKey.currentState!.save();
      final user = UserModel(
        id: _newUserId,
        name: _name,
        targetScore: _targetScore,
        dateOfBirth: _dob,
        avatarUrl: _avatarUrl,
        isFourSkills: _isFourSkills,
      );
      context.read<UserProvider>().addUser(user);
      DynamicIslandNotification.show(
        context,
        title: 'Thành công',
        message: 'Đã tạo hồ sơ ${user.name} thành công!',
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
                  'Tạo Hồ Sơ Mới',
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
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Vui lòng nhập tên';
                    }
                    return null;
                  },
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
                      title: 'Lưu & Tạo',
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

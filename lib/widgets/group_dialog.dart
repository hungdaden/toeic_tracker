import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:may_uikit/may_uikit.dart';
import '../widgets/dynamic_island_notification.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import '../theme/liquid_glass_theme.dart';

class GroupDialog extends StatefulWidget {
  const GroupDialog({super.key});

  @override
  State<GroupDialog> createState() => _GroupDialogState();
}

class _GroupDialogState extends State<GroupDialog> with SingleTickerProviderStateMixin {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isJoining = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleJoinGroup() async {
    final code = _codeController.text.trim().toUpperCase();
    if (code.length != 5) {
      DynamicIslandNotification.show(
        context,
        title: 'Lỗi',
        message: 'Mã nhóm phải có đúng 5 ký tự.',
        type: NotificationType.error,
      );
      return;
    }

    setState(() => _isJoining = true);
    try {
      final result = await context.read<UserProvider>().joinGroup(code).timeout(
        const Duration(seconds: 10),
        onTimeout: () => 'error',
      );
      setState(() => _isJoining = false);

      if (result == 'success') {
        if (mounted) {
          Navigator.pop(context);
          DynamicIslandNotification.show(
            context,
            title: 'Thành công',
            message: 'Đã tham gia nhóm thành công!',
            type: NotificationType.success,
          );
        }
      } else if (result == 'pending') {
        if (mounted) {
          Navigator.pop(context);
          DynamicIslandNotification.show(
            context,
            title: 'Chờ duyệt',
            message: 'Yêu cầu đã được gửi, vui lòng chờ duyệt.',
            type: NotificationType.info,
          );
        }
      } else if (result == 'not_found') {
        if (mounted) {
          DynamicIslandNotification.show(
            context,
            title: 'Lỗi',
            message: 'Không tìm thấy nhóm.',
            type: NotificationType.error,
          );
        }
      } else {
        if (mounted) {
          DynamicIslandNotification.show(
            context,
            title: 'Lỗi',
            message: 'Lỗi kết nối hoặc mã không hợp lệ.',
            type: NotificationType.error,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isJoining = false);
        DynamicIslandNotification.show(
          context,
          title: 'Lỗi',
          message: 'Lỗi kết nối hoặc mã không hợp lệ.',
          type: NotificationType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final user = provider.currentUser;
    final inGroup = user?.groupId != null && user!.groupId!.isNotEmpty;
    final isWaitingApproval = user?.pendingGroupId != null;

    if (isWaitingApproval) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: LiquidGlassContainer(
          borderRadius: 24,
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance.collection('groups').doc(user!.pendingGroupId).get(),
            builder: (context, snapshot) {
              String displayName = user.pendingGroupId ?? '';
              if (snapshot.hasData && snapshot.data!.exists) {
                displayName = (snapshot.data!.data() as Map<String, dynamic>)['name'] ?? displayName;
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Đang Chờ Duyệt',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.hourglass_empty_rounded, size: 48, color: Colors.orangeAccent),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Bạn đã gửi yêu cầu tham gia nhóm $displayName.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Vui lòng chờ trưởng nhóm hoặc phó nhóm phê duyệt.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.6)),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await provider.rejectMember(user);
                          if (mounted) Navigator.pop(context);
                        },
                        child: const Text('Hủy yêu cầu', style: TextStyle(color: Colors.redAccent)),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Đóng', style: TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: LiquidGlassContainer(
        borderRadius: 24,
        padding: inGroup ? const EdgeInsets.fromLTRB(16, 16, 16, 8) : const EdgeInsets.all(24),
        child: inGroup
            ? _buildInGroupContent(user, provider)
            : _buildNoGroupContent(provider),
      ),
    );
  }

  Widget _buildInGroupContent(UserModel currentUser, UserProvider provider) {
    final isLeader = currentUser.groupRole == 'leader';
    final isCoLeader = currentUser.groupRole == 'co-leader';
    final canManage = isLeader || isCoLeader;

    return SizedBox(
      width: double.maxFinite,
      height: 480,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Quản Lý Nhóm',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white70),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TabBar(
            controller: _tabController,
            indicatorColor: LiquidGlassTheme.primaryAccent,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            tabs: [
              const Tab(text: 'Thành viên'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Yêu cầu'),
                    if (provider.pendingMembers.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(left: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                        child: Text('${provider.pendingMembers.length}', style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                  ],
                ),
              ),
              const Tab(text: 'Cài đặt'),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMembersList(currentUser, provider),
                _buildPendingRequestsList(canManage, provider),
                _buildSettingsTab(isLeader, provider),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersList(UserModel currentUser, UserProvider provider) {
    final members = provider.groupMembers;
    final isLeader = currentUser.groupRole == 'leader';

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        final memberIsLeader = member.groupRole == 'leader';
        final memberIsCoLeader = member.groupRole == 'co-leader';

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: LiquidGlassTheme.primaryAccent.withValues(alpha: 0.3),
            backgroundImage: member.avatarUrl != null ? NetworkImage(member.avatarUrl!) : null,
            child: member.avatarUrl == null ? Text(member.name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : null,
          ),
          title: Text(member.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          subtitle: Text(
            memberIsLeader ? 'Trưởng nhóm' : (memberIsCoLeader ? 'Phó nhóm' : 'Thành viên'),
            style: TextStyle(
              color: memberIsLeader
                  ? Colors.amberAccent
                  : (memberIsCoLeader ? Colors.cyanAccent : Colors.white54),
              fontSize: 12,
            ),
          ),
          trailing: isLeader && member.id != currentUser.id ? PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white70),
            color: const Color(0xFF1E293B),
            onSelected: (val) async {
              try {
                if (val == 'kick') {
                  await provider.kickMember(member);
                  if (mounted) {
                    DynamicIslandNotification.show(
                      context,
                      title: 'Thành công',
                      message: 'Đã xóa ${member.name} khỏi nhóm',
                      type: NotificationType.warning,
                    );
                  }
                }
                if (val == 'promote') {
                  await provider.promoteMember(member);
                  if (mounted) {
                    DynamicIslandNotification.show(
                      context,
                      title: 'Thành công',
                      message: 'Đã phong ${member.name} làm Phó nhóm',
                      type: NotificationType.success,
                    );
                  }
                }
              } catch (e) {
                if (mounted) {
                  DynamicIslandNotification.show(
                    context,
                    title: 'Lỗi',
                    message: 'Không thể thực hiện thao tác: $e',
                    type: NotificationType.error,
                  );
                }
              }
            },
            itemBuilder: (context) => [
              if (!memberIsCoLeader)
                const PopupMenuItem(value: 'promote', child: Text('Phong phó nhóm', style: TextStyle(color: Colors.white))),
              const PopupMenuItem(value: 'kick', child: Text('Xóa khỏi nhóm', style: TextStyle(color: Colors.redAccent))),
            ],
          ) : null,
        );
      },
    );
  }

  Widget _buildPendingRequestsList(bool canManage, UserProvider provider) {
    final requests = provider.pendingMembers;
    if (!canManage) return const Center(child: Text('Chỉ trưởng/phó nhóm mới có thể duyệt.', style: TextStyle(color: Colors.white54)));
    if (requests.isEmpty) return const Center(child: Text('Không có yêu cầu nào.', style: TextStyle(color: Colors.white54)));

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final member = requests[index];
        return ListTile(
          title: Text(member.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check_circle_rounded, color: Colors.greenAccent),
                onPressed: () async {
                  try {
                    await provider.approveMember(member);
                    if (mounted) {
                      DynamicIslandNotification.show(
                        context,
                        title: 'Thành công',
                        message: 'Đã duyệt ${member.name} vào nhóm',
                        type: NotificationType.success,
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      DynamicIslandNotification.show(
                        context,
                        title: 'Lỗi',
                        message: 'Không thể duyệt thành viên: $e',
                        type: NotificationType.error,
                      );
                    }
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.cancel_rounded, color: Colors.redAccent),
                onPressed: () async {
                  try {
                    await provider.rejectMember(member);
                    if (mounted) {
                      DynamicIslandNotification.show(
                        context,
                        title: 'Đã từ chối',
                        message: 'Đã từ chối yêu cầu của ${member.name}',
                        type: NotificationType.warning,
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      DynamicIslandNotification.show(
                        context,
                        title: 'Lỗi',
                        message: 'Không thể thực hiện: $e',
                        type: NotificationType.error,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsTab(bool isLeader, UserProvider provider) {
    final group = provider.currentGroup;
    if (group == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Mã nhóm: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
              Text(
                group.id,
                style: const TextStyle(color: LiquidGlassTheme.secondaryAccent, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.copy_rounded, size: 16, color: Colors.white70),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: group.id));
                  DynamicIslandNotification.show(
                    context,
                    title: 'Đã sao chép',
                    message: 'Đã sao chép mã nhóm vào bộ nhớ tạm',
                    type: NotificationType.info,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Tên nhóm', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController..text = (_nameController.text.isEmpty ? group.name : _nameController.text),
                  enabled: isLeader,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Nhập tên nhóm',
                    hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                    ),
                  ),
                ),
              ),
              if (isLeader) ...[
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.save_rounded, color: LiquidGlassTheme.primaryAccent),
                  onPressed: () async {
                    try {
                      await provider.updateGroupName(_nameController.text);
                      if (mounted) {
                        DynamicIslandNotification.show(
                          context,
                          title: 'Thành công',
                          message: 'Đã đổi tên nhóm thành ${_nameController.text}',
                          type: NotificationType.success,
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        DynamicIslandNotification.show(
                          context,
                          title: 'Lỗi',
                          message: 'Không thể đổi tên nhóm: $e',
                          type: NotificationType.error,
                        );
                      }
                    }
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Yêu cầu kiểm duyệt', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            subtitle: Text('Thành viên mới cần được duyệt để tham gia', style: TextStyle(color: Colors.white.withValues(alpha: 0.55), fontSize: 12)),
            value: group.requireApproval,
            activeThumbColor: LiquidGlassTheme.primaryAccent,
            onChanged: isLeader ? (val) async {
              try {
                await provider.toggleApproval(val);
                if (mounted) {
                  DynamicIslandNotification.show(
                    context,
                    title: 'Đã cập nhật',
                    message: val ? 'Đã bật chế độ kiểm duyệt' : 'Đã tắt chế độ kiểm duyệt',
                    type: NotificationType.info,
                  );
                }
              } catch (e) {
                if (mounted) {
                  DynamicIslandNotification.show(
                    context,
                    title: 'Lỗi',
                    message: 'Không thể thay đổi cài đặt: $e',
                    type: NotificationType.error,
                  );
                }
              }
            } : null,
          ),
          const Divider(color: Colors.white12),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (c) => AlertDialog(
                    backgroundColor: const Color(0xFF1E293B),
                    title: const Text('Rời nhóm?', style: TextStyle(color: Colors.white)),
                    content: const Text('Nếu bạn là trưởng nhóm, quyền trưởng nhóm sẽ được chuyển giao.', style: TextStyle(color: Colors.white70)),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Hủy', style: TextStyle(color: Colors.white70))),
                      TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Xác nhận', style: TextStyle(color: Colors.redAccent))),
                    ],
                  ),
                );
                if (confirm == true && mounted) {
                  await provider.leaveGroup();
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.logout_rounded, color: Colors.redAccent, size: 18),
              label: const Text('Rời Nhóm', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.4)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoGroupContent(UserProvider provider) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Nhóm Học Tập',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.white70),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Tham gia nhóm để cùng theo dõi tiến độ và thi đua cùng bạn bè!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 14),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _codeController,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),
          decoration: InputDecoration(
            labelText: 'Mã nhóm (5 ký tự)',
            labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            hintText: 'VD: AB123',
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
            ),
          ),
          maxLength: 5,
          textCapitalization: TextCapitalization.characters,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: GlassButtonV2(
            title: 'Tham Gia Nhóm',
            onTap: _isJoining ? null : _handleJoinGroup,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Hoặc', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 12)),
            ),
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.15))),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: GlassButtonV2(
            title: 'Tạo Nhóm Mới',
            icon: const Icon(Icons.add_rounded, size: 20, color: Colors.white),
            onTap: () async {
              final name = await showDialog<String>(
                context: context,
                builder: (c) {
                  final ctrl = TextEditingController();
                  return AlertDialog(
                    backgroundColor: const Color(0xFF1E293B),
                    title: const Text('Đặt Tên Nhóm', style: TextStyle(color: Colors.white)),
                    content: TextField(
                      controller: ctrl,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Nhập tên nhóm',
                        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: LiquidGlassTheme.primaryAccent),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(c), child: const Text('Hủy', style: TextStyle(color: Colors.white70))),
                      TextButton(onPressed: () => Navigator.pop(c, ctrl.text), child: const Text('Tạo', style: TextStyle(color: LiquidGlassTheme.primaryAccent, fontWeight: FontWeight.bold))),
                    ],
                  );
                },
              );
              if (name != null && name.trim().isNotEmpty) {
                await provider.createGroup(name.trim());
                if (mounted) {
                  DynamicIslandNotification.show(
                    context,
                    title: 'Thành công',
                    message: 'Đã tạo nhóm ${name.trim()} thành công!',
                    type: NotificationType.success,
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}


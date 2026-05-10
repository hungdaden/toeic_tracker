import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/dynamic_island_notification.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';

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
      return AlertDialog(
        title: const Text('Đang Chờ Duyệt'),
        content: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('groups').doc(user!.pendingGroupId).get(),
          builder: (context, snapshot) {
            String displayName = user.pendingGroupId ?? '';
            if (snapshot.hasData && snapshot.data!.exists) {
              displayName = (snapshot.data!.data() as Map<String, dynamic>)['name'] ?? displayName;
            }
            
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.hourglass_empty_rounded, size: 50, color: Colors.orange),
                const SizedBox(height: 16),
                Text(
                  'Bạn đã gửi yêu cầu tham gia nhóm $displayName.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Vui lòng chờ trưởng nhóm hoặc phó nhóm phê duyệt.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            );
          }
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await provider.rejectMember(user); // Tự hủy yêu cầu bằng cách xóa pendingGroupId
              if (mounted) Navigator.pop(context);
            },
            child: const Text('Hủy yêu cầu', style: TextStyle(color: Colors.red)),
          ),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng')),
        ],
      );
    }

    return AlertDialog(
      title: Text(inGroup ? 'Quản Lý Nhóm' : 'Nhóm Học Tập'),
      contentPadding: EdgeInsets.zero,
      content: inGroup 
        ? _buildInGroupContent(user!, provider)
        : Padding(
            padding: const EdgeInsets.all(20),
            child: _buildNoGroupContent(provider),
          ),
      actions: [
        if (!inGroup)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
      ],
    );
  }

  Widget _buildInGroupContent(UserModel currentUser, UserProvider provider) {
    final isLeader = currentUser.groupRole == 'leader';
    final isCoLeader = currentUser.groupRole == 'co-leader';
    final canManage = isLeader || isCoLeader;

    return SizedBox(
      width: double.maxFinite,
      height: 450,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              const Tab(text: 'Thành viên'),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Yêu cầu'),
                    if (provider.pendingMembers.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        child: Text('${provider.pendingMembers.length}', style: const TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                  ],
                ),
              ),
              const Tab(text: 'Cài đặt'),
            ],
          ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Đóng')),
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
            backgroundImage: member.avatarUrl != null ? NetworkImage(member.avatarUrl!) : null,
            child: member.avatarUrl == null ? Text(member.name[0]) : null,
          ),
          title: Text(member.name),
          subtitle: Text(memberIsLeader ? 'Trưởng nhóm' : (memberIsCoLeader ? 'Phó nhóm' : 'Thành viên')),
          trailing: isLeader && member.id != currentUser.id ? PopupMenuButton<String>(
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
                const PopupMenuItem(value: 'promote', child: Text('Phong phó nhóm')),
              const PopupMenuItem(value: 'kick', child: Text('Xóa khỏi nhóm', style: TextStyle(color: Colors.red))),
            ],
          ) : null,
        );
      },
    );
  }

  Widget _buildPendingRequestsList(bool canManage, UserProvider provider) {
    final requests = provider.pendingMembers;
    if (!canManage) return const Center(child: Text('Chỉ trưởng/phó nhóm mới có thể duyệt.'));
    if (requests.isEmpty) return const Center(child: Text('Không có yêu cầu nào.'));

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final member = requests[index];
        return ListTile(
          title: Text(member.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green), 
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
                }
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red), 
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
                }
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
              const Text('Mã nhóm: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(group.id, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              IconButton(icon: const Icon(Icons.copy, size: 16), onPressed: () => Clipboard.setData(ClipboardData(text: group.id))),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Tên nhóm', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController..text = (_nameController.text.isEmpty ? group.name : _nameController.text),
                  enabled: isLeader,
                  decoration: const InputDecoration(hintText: 'Nhập tên nhóm'),
                ),
              ),
              if (isLeader)
                IconButton(
                  icon: const Icon(Icons.save), 
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
                  }
                ),
            ],
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Yêu cầu kiểm duyệt'),
            subtitle: const Text('Thành viên mới cần được duyệt để tham gia'),
            value: group.requireApproval,
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
          const Divider(),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text('Rời nhóm?'),
                    content: const Text('Nếu bạn là trưởng nhóm, quyền trưởng nhóm sẽ được chuyển giao.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(c, false), child: const Text('Hủy')),
                      TextButton(onPressed: () => Navigator.pop(c, true), child: const Text('Xác nhận', style: TextStyle(color: Colors.red))),
                    ],
                  ),
                );
                if (confirm == true && mounted) {
                  await provider.leaveGroup();
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text('Rời Nhóm'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.1), foregroundColor: Colors.red),
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
        const Text('Tham gia nhóm để cùng theo dõi tiến độ và thi đua cùng bạn bè!'),
        const SizedBox(height: 20),
        TextField(
          controller: _codeController,
          decoration: const InputDecoration(
            labelText: 'Mã nhóm (5 ký tự)',
            border: OutlineInputBorder(),
            hintText: 'VD: AB123',
          ),
          maxLength: 5,
          textCapitalization: TextCapitalization.characters,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isJoining ? null : _handleJoinGroup,
            child: _isJoining 
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) 
                : const Text('Tham Gia Nhóm'),
          ),
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('Hoặc')),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {
              final name = await showDialog<String>(
                context: context,
                builder: (c) {
                  final ctrl = TextEditingController();
                  return AlertDialog(
                    title: const Text('Đặt Tên Nhóm'),
                    content: TextField(controller: ctrl, decoration: const InputDecoration(hintText: 'Nhập tên nhóm')),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(c), child: const Text('Hủy')),
                      TextButton(onPressed: () => Navigator.pop(c, ctrl.text), child: const Text('Tạo')),
                    ],
                  );
                }
              );
              if (name != null) {
                await provider.createGroup(name);
                if (mounted) {
                  DynamicIslandNotification.show(
                    context,
                    title: 'Thành công',
                    message: 'Đã tạo nhóm $name thành công!',
                    type: NotificationType.success,
                  );
                }
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('Tạo Nhóm Mới'),
          ),
        ),
      ],
    );
  }
}

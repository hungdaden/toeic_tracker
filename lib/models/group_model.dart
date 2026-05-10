class GroupModel {
  final String id;
  String name;
  bool requireApproval;
  String leaderId;

  GroupModel({
    required this.id,
    required this.name,
    this.requireApproval = false,
    required this.leaderId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'requireApproval': requireApproval,
    'leaderId': leaderId,
  };

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
    id: json['id'],
    name: json['name'] ?? 'Nhóm mới',
    requireApproval: json['requireApproval'] ?? false,
    leaderId: json['leaderId'] ?? '',
  );
}

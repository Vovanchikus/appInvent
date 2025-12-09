class OperationItem {
  final int id;
  final String? type;
  final String? createdAt;

  OperationItem({required this.id, this.type, this.createdAt});

  factory OperationItem.fromJson(Map<String, dynamic> json) {
    return OperationItem(
      id: json['id'],
      type: json['type'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'type': type, 'created_at': createdAt};
  }
}

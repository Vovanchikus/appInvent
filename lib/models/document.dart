class InvDocument {
  final int id;
  final String? name;
  final String? fileUrl;
  final String? fileName;
  final String? createdAt;

  InvDocument({
    required this.id,
    this.name,
    this.fileUrl,
    this.fileName,
    this.createdAt,
  });

  factory InvDocument.fromJson(Map<String, dynamic> json) {
    return InvDocument(
      id: json['id'],
      name: json['name'],
      fileUrl: json['file_url'],
      fileName: json['file_name'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'file_url': fileUrl,
      'file_name': fileName,
      'created_at': createdAt,
    };
  }
}

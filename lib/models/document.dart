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
}

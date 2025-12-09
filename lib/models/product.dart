class Product {
  final int id;
  final String name;
  final String? unit;
  final int? quantity;
  final String? createdAt;

  Product({
    required this.id,
    required this.name,
    this.unit,
    this.quantity,
    this.createdAt,
  });
}

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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      unit: json['unit'],
      quantity: json['quantity'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'unit': unit,
      'quantity': quantity,
      'created_at': createdAt,
    };
  }
}

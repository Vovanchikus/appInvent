class Product {
  final int id;
  final String name;
  final String unit;
  final String price;
  final int quantity;
  final String sum;
  final String createdAt;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.quantity,
    required this.sum,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      unit: json['unit'] ?? '',
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
      sum: json['sum'] ?? 0,
      createdAt: json['createdAt'] ?? '',
    );
  }
}

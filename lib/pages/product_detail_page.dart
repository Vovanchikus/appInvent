import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Название: ${product.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Кол-во: ${product.quantity}"),
            Text("Ед.: ${product.unit}"),
            Text("Цена: ${product.price}"),
            Text("Сумма: ${product.sum}"),
            Text("Дата добавления: ${product.createdAt}"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../database/app_database.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class ScanPage extends StatefulWidget {
  final AppDatabase db;

  const ScanPage({super.key, required this.db});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) async {
              if (!scanned) {
                scanned = true; // предотвращаем повторное срабатывание
                final code = capture.barcodes.first.rawValue;

                if (code != null) {
                  final int? productId = int.tryParse(code);
                  if (productId != null) {
                    final productRow =
                        await (widget.db.select(widget.db.productsTable)
                              ..where((tbl) => tbl.id.equals(productId)))
                            .getSingleOrNull();

                    if (productRow != null && mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                            product: Product(
                              id: productRow.id,
                              name: productRow.name,
                              unit: productRow.unit ?? '',
                              quantity: productRow.quantity ?? 0,
                              price: productRow.price?.toString() ?? '0',
                              sum: productRow.sum?.toString() ?? '0',
                              createdAt: productRow.createdAt ?? '',
                            ),
                          ),
                        ),
                      );
                    } else if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Продукт не найден')),
                      );
                      Navigator.pop(context);
                    }
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Неверный QR-код')),
                    );
                    Navigator.pop(context);
                  }
                }
              }
            },
          ),

          // Кастомный overlay как в UI Kit
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Кнопка назад
          Positioned(
            top: 50,
            left: 16,
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

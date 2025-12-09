import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../database/app_database.dart';
import '../models/product.dart';
import '../models/document.dart';
import '../services/sync_service.dart';

class HomePage extends StatefulWidget {
  final ApiService api;
  final AppDatabase db;
  final SyncService syncService;

  const HomePage(
      {super.key,
      required this.api,
      required this.db,
      required this.syncService});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<InvDocument> documents = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _syncAndLoad();
  }

  Future<void> _syncAndLoad() async {
    setState(() => isLoading = true);
    try {
      // Синхронизация с сервером
      await widget.syncService.syncAll();

      // Загрузка из базы
      final productList = await widget.db.select(widget.db.productsTable).get();
      final documentList =
          await widget.db.select(widget.db.documentsTable).get();

      setState(() {
        products = productList
            .map((p) => Product(
                  id: p.id,
                  name: p.name,
                  unit: p.unit ?? '',
                  quantity: p.quantity ?? 0, // для отображения
                  price: p.price?.toString() ?? '0',
                  sum: p.sum?.toString() ?? '0',
                  createdAt: p.createdAt ?? '',
                ))
            .toList();

        documents = documentList
            .map((d) => InvDocument(
                  id: d.id,
                  name: d.name ?? '',
                  fileUrl: d.fileUrl ?? '',
                  fileName: d.fileName ?? '',
                  createdAt: d.createdAt ?? '',
                ))
            .toList();
      });
    } catch (e) {
      print('Error syncing: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InventPro Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _syncAndLoad,
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Товары:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (_, index) {
                        final p = products[index];
                        return ListTile(
                          title: Text(p.name),
                          subtitle:
                              Text('Ед.изм: ${p.unit}, К-во: ${p.quantity}'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Documents:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (_, index) {
                        final d = documents[index];
                        return ListTile(
                          title: Text(d.name ?? 'No name'),
                          subtitle: Text(d.fileName ?? 'No name'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import '/services/sync_service.dart';
import '/api/api_service.dart';
import '/database/app_database.dart';
import '/models/product.dart';
import '/models/document.dart';
import '/models/operation.dart';
import '/screens/home_page.dart';

class HomePage extends StatefulWidget {
  final ApiService api;
  final AppDatabase db;

  HomePage({required this.api, required this.db});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SyncService syncService;

  List<Product> products = [];
  List<InvDocument> documents = [];
  List<OperationItem> operations = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    syncService = SyncService(api: widget.api, db: widget.db);
    _loadLocalData();
  }

  Future<void> _loadLocalData() async {
    setState(() => isLoading = true);

    // Загружаем из локальной базы Drift
    products = await widget.db
        .select(widget.db.productsTable)
        .get()
        .then(
          (rows) => rows
              .map(
                (r) => Product(
                  id: r.id,
                  name: r.name,
                  unit: r.unit,
                  quantity: r.quantity,
                  createdAt: r.createdAt,
                ),
              )
              .toList(),
        );

    documents = await widget.db
        .select(widget.db.documentsTable)
        .get()
        .then(
          (rows) => rows
              .map(
                (r) => InvDocument(
                  id: r.id,
                  name: r.name,
                  fileUrl: r.fileUrl,
                  fileName: r.fileName,
                  createdAt: r.createdAt,
                ),
              )
              .toList(),
        );

    operations = await widget.db
        .select(widget.db.operationsTable)
        .get()
        .then(
          (rows) => rows
              .map(
                (r) => OperationItem(
                  id: r.id,
                  type: r.type,
                  createdAt: r.createdAt,
                ),
              )
              .toList(),
        );

    setState(() => isLoading = false);
  }

  Future<void> _syncData() async {
    setState(() => isLoading = true);
    await syncService.syncAll();
    await _loadLocalData();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InventPro'),
        actions: [IconButton(icon: Icon(Icons.sync), onPressed: _syncData)],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    'Products',
                    products.map((p) => p.name).toList(),
                  ),
                  _buildSection(
                    'Documents',
                    documents.map((d) => d.fileName ?? 'Unknown').toList(),
                  ),
                  _buildSection(
                    'Operations',
                    operations.map((o) => o.type ?? 'Unknown').toList(),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ...items.map(
            (e) => Card(
              child: Padding(padding: EdgeInsets.all(8), child: Text(e)),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

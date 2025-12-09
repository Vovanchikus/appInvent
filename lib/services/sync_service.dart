import 'package:connectivity_plus/connectivity_plus.dart';
import '../api/api_service.dart';
import '../database/app_database.dart';
import '../models/product.dart';
import '../models/document.dart';
import '../models/operation.dart';

class SyncService {
  final ApiService api;
  final AppDatabase db;

  SyncService({required this.api, required this.db});

  Future<void> syncAll() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) return;

    // --- Products
    List<Product> products = await api.fetchProducts();
    await db.upsertProducts(products);

    // --- Documents
    List<InvDocument> documents = await api.fetchDocuments();
    await db.upsertDocuments(documents);

    // --- Operations
    List<OperationItem> operations = await api.fetchOperations();
    await db.upsertOperations(operations);
  }
}

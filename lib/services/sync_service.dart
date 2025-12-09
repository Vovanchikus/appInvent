// lib/services/sync_service.dart
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
    try {
      print('--- SYNC START ---');

      final products = await api.fetchProducts();
      await db.upsertProducts(products);
      print('Products synced: ${products.length}');

      final documents = await api.fetchDocuments();
      await db.upsertDocuments(documents);
      print('Documents synced: ${documents.length}');

      final operations = await api.fetchOperations();
      await db.upsertOperations(operations);
      print('Operations synced: ${operations.length}');

      print('--- SYNC FINISHED ---');
    } catch (e) {
      print('SYNC ERROR: $e');
    }
  }
}

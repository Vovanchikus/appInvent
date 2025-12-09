import '../api/api_service.dart';
import '../database/app_database.dart';

class SyncService {
  final ApiService api;
  final AppDatabase db;

  SyncService({required this.api, required this.db});

  Future<void> syncAll() async {
    // Логика синхронизации
  }
}

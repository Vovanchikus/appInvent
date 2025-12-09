import 'dart:io';
import 'package:flutter/material.dart';
import 'http_override.dart';
import 'api/api_service.dart';
import 'database/app_database.dart';
import 'pages/home_page.dart';
import 'services/sync_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides(); // обход SSL

  final db = AppDatabase();
  final api = ApiService(baseUrl: 'https://192.168.0.104/api');
  final syncService = SyncService(api: api, db: db);

  // Синхронизация при старте
  await syncService.syncAll();

  runApp(MyApp(api: api, db: db, syncService: syncService));
}

class MyApp extends StatelessWidget {
  final ApiService api;
  final AppDatabase db;
  final SyncService syncService;

  const MyApp(
      {super.key,
      required this.api,
      required this.db,
      required this.syncService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventPro',
      theme: AppTheme.light,
      home: HomePage(api: api, db: db, syncService: syncService),
    );
  }
}

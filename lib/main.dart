import 'package:flutter/material.dart';
import 'database/app_database.dart';
import 'services/sync_service.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final api = ApiService(); // твой сервис API

  runApp(MyApp(api: api, db: db));
}

class MyApp extends StatelessWidget {
  final ApiService api;
  final AppDatabase db;

  const MyApp({super.key, required this.api, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventPro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(api: api, db: db),
    );
  }
}

import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'database/app_database.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final api = ApiService();

  runApp(MyApp(api: api, db: db));
}

class MyApp extends StatelessWidget {
  final ApiService api;
  final AppDatabase db;

  MyApp({required this.api, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventPro',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(api: api, db: db),
    );
  }
}

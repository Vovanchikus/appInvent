import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../database/app_database.dart';

class HomePage extends StatelessWidget {
  final ApiService api;
  final AppDatabase db;

  HomePage({required this.api, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InventPro Home')),
      body: Center(child: Text('Приложение готово к работе!')),
    );
  }
}

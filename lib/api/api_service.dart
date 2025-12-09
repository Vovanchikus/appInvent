// lib/api/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../models/document.dart';
import '../models/operation.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl}); // базовый URL сервера

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List productsData = json['data'] ?? [];
      return productsData.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<InvDocument>> fetchDocuments() async {
    final response = await http.get(Uri.parse('$baseUrl/documents'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List documentsData = json['data'] ?? [];
      return documentsData.map((e) => InvDocument.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load documents');
    }
  }

  Future<List<OperationItem>> fetchOperations() async {
    final response = await http.get(Uri.parse('$baseUrl/operations'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List operationsData = json['data'] ?? [];
      return operationsData.map((e) => OperationItem.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load operations');
    }
  }
}

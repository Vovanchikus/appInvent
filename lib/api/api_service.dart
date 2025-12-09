import 'package:dio/dio.dart';
import '../models/product.dart';
import '../models/document.dart';
import '../models/operation.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.104/api', // <- локальный IP ПК
    ),
  );

  Future<List<Product>> fetchProducts() async {
    final res = await _dio.get('/products');
    final data = (res.data as List<dynamic>);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<InvDocument>> fetchDocuments() async {
    final res = await _dio.get('/documents');
    final data = (res.data['data'] as List<dynamic>);
    return data.map((e) => InvDocument.fromJson(e)).toList();
  }

  Future<List<OperationItem>> fetchOperations() async {
    final res = await _dio.get('/operations');
    final data = (res.data as List<dynamic>);
    return data.map((e) => OperationItem.fromJson(e)).toList();
  }
}

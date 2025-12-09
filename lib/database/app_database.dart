// lib/database/app_database.dart

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../models/product.dart';
import '../models/document.dart';
import '../models/operation.dart';

part 'app_database.g.dart';

class ProductsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get unit => text().nullable()();
  RealColumn get price => real()(); // double
  IntColumn get quantity => integer()(); // int
  RealColumn get sum => real()(); // double
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class DocumentsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get fileUrl => text().nullable()();
  TextColumn get fileName => text().nullable()();
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class OperationsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get type => text().nullable()();
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [ProductsTable, DocumentsTable, OperationsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // --- Products
  Future<void> upsertProducts(List<Product> items) async {
    for (var p in items) {
      into(productsTable).insertOnConflictUpdate(
        ProductsTableCompanion(
          id: Value(p.id),
          name: Value(p.name),
          unit: Value(p.unit ?? ''),
          price: Value(p.price != null ? double.tryParse(p.price!) : 0.0),
          quantity: Value(p.quantity ?? 0),
          sum: Value(p.sum != null ? double.tryParse(p.sum!) : 0.0),
          createdAt: Value(p.createdAt),
        ),
      );
    }
  }

  // --- Documents
  Future<void> upsertDocuments(List<InvDocument> items) async {
    for (var d in items) {
      into(documentsTable).insertOnConflictUpdate(
        DocumentsTableCompanion(
          id: Value(d.id),
          name: Value(d.name),
          fileUrl: Value(d.fileUrl),
          fileName: Value(d.fileName),
          createdAt: Value(d.createdAt),
        ),
      );
    }
  }

  // --- Operations
  Future<void> upsertOperations(List<OperationItem> items) async {
    for (var o in items) {
      into(operationsTable).insertOnConflictUpdate(
        OperationsTableCompanion(
          id: Value(o.id),
          type: Value(o.type),
          createdAt: Value(o.createdAt),
        ),
      );
    }
  }
}

// --- Подключение к базе для Flutter без drift_flutter
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import '../models/product.dart';
import '../models/document.dart';
import '../models/operation.dart';

part 'app_database.g.dart';

class ProductsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get unit => text().nullable()();
  IntColumn get quantity => integer().nullable()();
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

  Future<void> upsertProducts(List<Product> items) async {
    for (var p in items) {
      into(productsTable).insertOnConflictUpdate(
        ProductsTableCompanion(
          id: Value(p.id),
          name: Value(p.name),
          unit: Value(p.unit),
          quantity: Value(p.quantity),
          createdAt: Value(p.createdAt),
        ),
      );
    }
  }

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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}

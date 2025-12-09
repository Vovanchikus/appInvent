import 'package:drift/drift.dart';

class ProductsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get unit => text().nullable()();
  IntColumn get quantity => integer().nullable()();
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

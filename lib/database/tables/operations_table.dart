import 'package:drift/drift.dart';

class OperationsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get type => text().nullable()();
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:drift/drift.dart';

class DocumentsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get fileName => text().nullable()();
  TextColumn get fileUrl => text().nullable()();
  TextColumn get createdAt => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, unit, quantity, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  final int id;
  final String name;
  final String? unit;
  final int? quantity;
  final String? createdAt;
  const ProductsTableData(
      {required this.id,
      required this.name,
      this.unit,
      this.quantity,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      id: Value(id),
      name: Value(name),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory ProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String?>(json['unit']),
      quantity: serializer.fromJson<int?>(json['quantity']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String?>(unit),
      'quantity': serializer.toJson<int?>(quantity),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  ProductsTableData copyWith(
          {int? id,
          String? name,
          Value<String?> unit = const Value.absent(),
          Value<int?> quantity = const Value.absent(),
          Value<String?> createdAt = const Value.absent()}) =>
      ProductsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit.present ? unit.value : this.unit,
        quantity: quantity.present ? quantity.value : this.quantity,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, unit, quantity, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> unit;
  final Value<int?> quantity;
  final Value<String?> createdAt;
  const ProductsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.unit = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ProductsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<int>? quantity,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? unit,
      Value<int?>? quantity,
      Value<String?>? createdAt}) {
    return ProductsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTableTable extends DocumentsTable
    with TableInfo<$DocumentsTableTable, DocumentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileUrlMeta =
      const VerificationMeta('fileUrl');
  @override
  late final GeneratedColumn<String> fileUrl = GeneratedColumn<String>(
      'file_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, fileUrl, fileName, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents_table';
  @override
  VerificationContext validateIntegrity(Insertable<DocumentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('file_url')) {
      context.handle(_fileUrlMeta,
          fileUrl.isAcceptableOrUnknown(data['file_url']!, _fileUrlMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      fileUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_url']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $DocumentsTableTable createAlias(String alias) {
    return $DocumentsTableTable(attachedDatabase, alias);
  }
}

class DocumentsTableData extends DataClass
    implements Insertable<DocumentsTableData> {
  final int id;
  final String? name;
  final String? fileUrl;
  final String? fileName;
  final String? createdAt;
  const DocumentsTableData(
      {required this.id,
      this.name,
      this.fileUrl,
      this.fileName,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || fileUrl != null) {
      map['file_url'] = Variable<String>(fileUrl);
    }
    if (!nullToAbsent || fileName != null) {
      map['file_name'] = Variable<String>(fileName);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  DocumentsTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentsTableCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      fileUrl: fileUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fileUrl),
      fileName: fileName == null && nullToAbsent
          ? const Value.absent()
          : Value(fileName),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory DocumentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      fileUrl: serializer.fromJson<String?>(json['fileUrl']),
      fileName: serializer.fromJson<String?>(json['fileName']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'fileUrl': serializer.toJson<String?>(fileUrl),
      'fileName': serializer.toJson<String?>(fileName),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  DocumentsTableData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> fileUrl = const Value.absent(),
          Value<String?> fileName = const Value.absent(),
          Value<String?> createdAt = const Value.absent()}) =>
      DocumentsTableData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        fileUrl: fileUrl.present ? fileUrl.value : this.fileUrl,
        fileName: fileName.present ? fileName.value : this.fileName,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  DocumentsTableData copyWithCompanion(DocumentsTableCompanion data) {
    return DocumentsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      fileUrl: data.fileUrl.present ? data.fileUrl.value : this.fileUrl,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, fileUrl, fileName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.fileUrl == this.fileUrl &&
          other.fileName == this.fileName &&
          other.createdAt == this.createdAt);
}

class DocumentsTableCompanion extends UpdateCompanion<DocumentsTableData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> fileUrl;
  final Value<String?> fileName;
  final Value<String?> createdAt;
  const DocumentsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.fileName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DocumentsTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.fileName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DocumentsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? fileUrl,
    Expression<String>? fileName,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (fileUrl != null) 'file_url': fileUrl,
      if (fileName != null) 'file_name': fileName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DocumentsTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? fileUrl,
      Value<String?>? fileName,
      Value<String?>? createdAt}) {
    return DocumentsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      fileUrl: fileUrl ?? this.fileUrl,
      fileName: fileName ?? this.fileName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('fileName: $fileName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $OperationsTableTable extends OperationsTable
    with TableInfo<$OperationsTableTable, OperationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operations_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OperationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $OperationsTableTable createAlias(String alias) {
    return $OperationsTableTable(attachedDatabase, alias);
  }
}

class OperationsTableData extends DataClass
    implements Insertable<OperationsTableData> {
  final int id;
  final String? type;
  final String? createdAt;
  const OperationsTableData({required this.id, this.type, this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    return map;
  }

  OperationsTableCompanion toCompanion(bool nullToAbsent) {
    return OperationsTableCompanion(
      id: Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory OperationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperationsTableData(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String?>(json['type']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String?>(type),
      'createdAt': serializer.toJson<String?>(createdAt),
    };
  }

  OperationsTableData copyWith(
          {int? id,
          Value<String?> type = const Value.absent(),
          Value<String?> createdAt = const Value.absent()}) =>
      OperationsTableData(
        id: id ?? this.id,
        type: type.present ? type.value : this.type,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  OperationsTableData copyWithCompanion(OperationsTableCompanion data) {
    return OperationsTableData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OperationsTableData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationsTableData &&
          other.id == this.id &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class OperationsTableCompanion extends UpdateCompanion<OperationsTableData> {
  final Value<int> id;
  final Value<String?> type;
  final Value<String?> createdAt;
  const OperationsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OperationsTableCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<OperationsTableData> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OperationsTableCompanion copyWith(
      {Value<int>? id, Value<String?>? type, Value<String?>? createdAt}) {
    return OperationsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperationsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $DocumentsTableTable documentsTable = $DocumentsTableTable(this);
  late final $OperationsTableTable operationsTable =
      $OperationsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [productsTable, documentsTable, operationsTable];
}

typedef $$ProductsTableTableCreateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> unit,
  Value<int?> quantity,
  Value<String?> createdAt,
});
typedef $$ProductsTableTableUpdateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> unit,
  Value<int?> quantity,
  Value<String?> createdAt,
});

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (
      ProductsTableData,
      BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>
    ),
    ProductsTableData,
    PrefetchHooks Function()> {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              ProductsTableCompanion(
            id: id,
            name: name,
            unit: unit,
            quantity: quantity,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> unit = const Value.absent(),
            Value<int?> quantity = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              ProductsTableCompanion.insert(
            id: id,
            name: name,
            unit: unit,
            quantity: quantity,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (
      ProductsTableData,
      BaseReferences<_$AppDatabase, $ProductsTableTable, ProductsTableData>
    ),
    ProductsTableData,
    PrefetchHooks Function()>;
typedef $$DocumentsTableTableCreateCompanionBuilder = DocumentsTableCompanion
    Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> fileUrl,
  Value<String?> fileName,
  Value<String?> createdAt,
});
typedef $$DocumentsTableTableUpdateCompanionBuilder = DocumentsTableCompanion
    Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> fileUrl,
  Value<String?> fileName,
  Value<String?> createdAt,
});

class $$DocumentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$DocumentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileUrl => $composableBuilder(
      column: $table.fileUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DocumentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTableTable> {
  $$DocumentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get fileUrl =>
      $composableBuilder(column: $table.fileUrl, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DocumentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DocumentsTableTable,
    DocumentsTableData,
    $$DocumentsTableTableFilterComposer,
    $$DocumentsTableTableOrderingComposer,
    $$DocumentsTableTableAnnotationComposer,
    $$DocumentsTableTableCreateCompanionBuilder,
    $$DocumentsTableTableUpdateCompanionBuilder,
    (
      DocumentsTableData,
      BaseReferences<_$AppDatabase, $DocumentsTableTable, DocumentsTableData>
    ),
    DocumentsTableData,
    PrefetchHooks Function()> {
  $$DocumentsTableTableTableManager(
      _$AppDatabase db, $DocumentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> fileUrl = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              DocumentsTableCompanion(
            id: id,
            name: name,
            fileUrl: fileUrl,
            fileName: fileName,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> fileUrl = const Value.absent(),
            Value<String?> fileName = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              DocumentsTableCompanion.insert(
            id: id,
            name: name,
            fileUrl: fileUrl,
            fileName: fileName,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DocumentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DocumentsTableTable,
    DocumentsTableData,
    $$DocumentsTableTableFilterComposer,
    $$DocumentsTableTableOrderingComposer,
    $$DocumentsTableTableAnnotationComposer,
    $$DocumentsTableTableCreateCompanionBuilder,
    $$DocumentsTableTableUpdateCompanionBuilder,
    (
      DocumentsTableData,
      BaseReferences<_$AppDatabase, $DocumentsTableTable, DocumentsTableData>
    ),
    DocumentsTableData,
    PrefetchHooks Function()>;
typedef $$OperationsTableTableCreateCompanionBuilder = OperationsTableCompanion
    Function({
  Value<int> id,
  Value<String?> type,
  Value<String?> createdAt,
});
typedef $$OperationsTableTableUpdateCompanionBuilder = OperationsTableCompanion
    Function({
  Value<int> id,
  Value<String?> type,
  Value<String?> createdAt,
});

class $$OperationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $OperationsTableTable> {
  $$OperationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$OperationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OperationsTableTable> {
  $$OperationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OperationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OperationsTableTable> {
  $$OperationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OperationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OperationsTableTable,
    OperationsTableData,
    $$OperationsTableTableFilterComposer,
    $$OperationsTableTableOrderingComposer,
    $$OperationsTableTableAnnotationComposer,
    $$OperationsTableTableCreateCompanionBuilder,
    $$OperationsTableTableUpdateCompanionBuilder,
    (
      OperationsTableData,
      BaseReferences<_$AppDatabase, $OperationsTableTable, OperationsTableData>
    ),
    OperationsTableData,
    PrefetchHooks Function()> {
  $$OperationsTableTableTableManager(
      _$AppDatabase db, $OperationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OperationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OperationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OperationsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              OperationsTableCompanion(
            id: id,
            type: type,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> createdAt = const Value.absent(),
          }) =>
              OperationsTableCompanion.insert(
            id: id,
            type: type,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OperationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OperationsTableTable,
    OperationsTableData,
    $$OperationsTableTableFilterComposer,
    $$OperationsTableTableOrderingComposer,
    $$OperationsTableTableAnnotationComposer,
    $$OperationsTableTableCreateCompanionBuilder,
    $$OperationsTableTableUpdateCompanionBuilder,
    (
      OperationsTableData,
      BaseReferences<_$AppDatabase, $OperationsTableTable, OperationsTableData>
    ),
    OperationsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$DocumentsTableTableTableManager get documentsTable =>
      $$DocumentsTableTableTableManager(_db, _db.documentsTable);
  $$OperationsTableTableTableManager get operationsTable =>
      $$OperationsTableTableTableManager(_db, _db.operationsTable);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskNameMeta =
      const VerificationMeta('taskName');
  @override
  late final GeneratedColumn<String> taskName = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted =
      GeneratedColumn<bool>('is_completed', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [id, taskName, finishTime, isCompleted];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableOrUnknown(data['name']!, _taskNameMeta));
    } else if (isInserting) {
      context.missing(_taskNameMeta);
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    } else if (isInserting) {
      context.missing(_finishTimeMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String taskName;
  final DateTime finishTime;
  final bool isCompleted;
  const Todo(
      {required this.id,
      required this.taskName,
      required this.finishTime,
      required this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(taskName);
    map['finish_time'] = Variable<DateTime>(finishTime);
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      taskName: Value(taskName),
      finishTime: Value(finishTime),
      isCompleted: Value(isCompleted),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      taskName: serializer.fromJson<String>(json['taskName']),
      finishTime: serializer.fromJson<DateTime>(json['finishTime']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskName': serializer.toJson<String>(taskName),
      'finishTime': serializer.toJson<DateTime>(finishTime),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  Todo copyWith(
          {int? id,
          String? taskName,
          DateTime? finishTime,
          bool? isCompleted}) =>
      Todo(
        id: id ?? this.id,
        taskName: taskName ?? this.taskName,
        finishTime: finishTime ?? this.finishTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('taskName: $taskName, ')
          ..write('finishTime: $finishTime, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskName, finishTime, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.taskName == this.taskName &&
          other.finishTime == this.finishTime &&
          other.isCompleted == this.isCompleted);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> taskName;
  final Value<DateTime> finishTime;
  final Value<bool> isCompleted;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.taskName = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String taskName,
    required DateTime finishTime,
    required bool isCompleted,
  })  : taskName = Value(taskName),
        finishTime = Value(finishTime),
        isCompleted = Value(isCompleted);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? taskName,
    Expression<DateTime>? finishTime,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskName != null) 'name': taskName,
      if (finishTime != null) 'finish_time': finishTime,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? taskName,
      Value<DateTime>? finishTime,
      Value<bool>? isCompleted}) {
    return TodosCompanion(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      finishTime: finishTime ?? this.finishTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskName.present) {
      map['name'] = Variable<String>(taskName.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('taskName: $taskName, ')
          ..write('finishTime: $finishTime, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TodosTable todos = $TodosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}

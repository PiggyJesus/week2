import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskName => text().named('name')();
  DateTimeColumn get createTime => dateTime()();
  BoolColumn get isCompleted => boolean()();
}
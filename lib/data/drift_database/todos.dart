import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskName => text().named('name')();
  DateTimeColumn get finishTime => dateTime()();
  BoolColumn get isCompleted => boolean()();
}



import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:week2/database/todos.dart';

part 'database.g.dart';


LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}




@DriftDatabase(tables: [Todos])
class AppDb extends _$AppDb {
  AppDb(): super(_openConnection());

  @override
  int get schemaVersion => 1;
}
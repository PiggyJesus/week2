import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week2/database/database.dart';
import 'package:week2/route/route_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todos_bloc.dart';

late AppDb appDb;

void main() {
  appDb = AppDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 791),
      builder: (context, child) {
        return BlocProvider(
          create: (_) => TodosBloc()..add(TodosGetEvent()),
          child: MaterialApp(
            title: 'Todos',
            theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}

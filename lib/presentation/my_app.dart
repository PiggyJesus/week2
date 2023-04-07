import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:week2/domain/repository/todos_bloc.dart';

import 'navigation/route_generator.dart';



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
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
              ),
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week2/pages/information_page/information_page.dart';
import 'package:week2/pages/tasks_page/tasks_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TasksPage());
      case '/information_page':
        return MaterialPageRoute(builder: (_) => const InformationPage());
      default:
        return MaterialPageRoute(builder: (_) => const _ErrorPage());
    }
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No page was found"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/presentation/screen/addTodo/add_page.dart';
import 'package:todolist/presentation/screen/home/home_page.dart';

class Routes {
  static const String homeRoute = "/HomeScreen";
  static const String addTodoRoute = "/addTodoRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (ctx) => HomeTodoPage());
      case Routes.addTodoRoute:
        return MaterialPageRoute(builder: (ctx) => AddTodoPage());
      default:
        print(routeSettings.name);
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("No Route found"),
            ),
            body: const Center(
              child: Text("No Route found"),
            )));
  }
}

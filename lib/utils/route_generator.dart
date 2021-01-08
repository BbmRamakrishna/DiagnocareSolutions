import 'package:getx/view/getx_screen.dart';
import 'package:getx/widget/cp_appbar.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => GetxScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: CPAppBar(
          title: 'Error',
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

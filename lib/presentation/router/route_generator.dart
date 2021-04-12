import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../first_page.dart';
import '../second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstPageRoute:
        return MaterialPageRoute(builder: (_) => FirstPage());
      case secondPageRoute:
        final title = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SecondPage(receivedTitle: title));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}

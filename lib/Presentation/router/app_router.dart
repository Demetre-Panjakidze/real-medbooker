import 'package:flutter/material.dart';
import 'package:medbooker/Presentation/screens/homepage.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Homepage(),
        );
      default:
        return null;
    }
  }
}

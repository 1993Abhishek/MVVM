import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvme/ui/helper/route_animation.dart';

const String initialRoute = "/";
class MVVMRouter {
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_HOME = "home";
  static const String ROUTE_WEB_VIEW = "webView";
  static const String ROUTE_LOG_IN = "login";
  static const String ROUTE_REGISTER = "registration";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;
    switch (settings.name) {
      case ROUTE_INITIAL:
        // currentWidget = SplashScreen();
        break;
      case ROUTE_HOME:
        // currentWidget = HomeView();
        break;

      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return FadeRoute(page: currentWidget, settings: settings);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nvme/ui/helper/route_animation.dart';
import 'package:nvme/ui/views/dashboard.dart';
import 'package:nvme/ui/views/home.dart';
import 'package:nvme/ui/views/login.dart';
import 'package:nvme/ui/views/payment.dart';
import 'package:nvme/ui/views/register.dart';
import 'package:nvme/ui/views/splash_screen.dart';

const String initialRoute = "/";

class MVVMRouter {
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_HOME = "home";
  static const String ROUTE_DASHBOARD = "dashboard";
  static const String ROUTE_WEB_VIEW = "webView";
  static const String ROUTE_LOG_IN = "login";
  static const String ROUTE_REGISTER = "registration";
  static const String ROUTE_PAYMENT = "payment";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;
    switch (settings.name) {
      case ROUTE_INITIAL:
        currentWidget = SplashSCreen();
        break;
      case ROUTE_HOME:
        currentWidget = HomeScreen();
        break;
      case ROUTE_DASHBOARD:
        currentWidget = DashboardScreen();
        break;
      case ROUTE_LOG_IN:
        currentWidget = LogInScreen();
        break;
      case ROUTE_REGISTER:
        currentWidget = RegistrationScreen();
        break;
      case ROUTE_PAYMENT:
        currentWidget = PaymentScreen();
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

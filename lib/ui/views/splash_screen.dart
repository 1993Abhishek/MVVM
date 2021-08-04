import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nvme/router.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({Key key}) : super(key: key);

  @override
  _SplashSCreenState createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/Diana_Food.jpg",
          ),
        )),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        MVVMRouter.ROUTE_LOG_IN,
      );
    });
    super.initState();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nvme/router.dart';
import 'package:nvme/ui/helper/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MVVM(),
    );
  }
}


class MVVM extends StatefulWidget {
  const MVVM({Key key}) : super(key: key);

  @override
  _MVVMState createState() => _MVVMState();
}

class _MVVMState extends State<MVVM> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sunetra',
      theme: ThemeData.light(),
      initialRoute: MVVMRouter.ROUTE_INITIAL,
      onGenerateRoute: MVVMRouter.generateRoute,
    );
  }
}

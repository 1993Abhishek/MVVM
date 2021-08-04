import 'package:flutter/material.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/widgets/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget roundedButton() {
    return Container(
      height: hDimen(50),
      width: hDimen(50),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            hDimen(50),
          ),
        ),
        elevation: 2,
        child: Center(
          child: Icon(
            Icons.view_headline,
            size: hDimen(35),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text("Hello",style: TextStyle(color: Colors.black),),
             Text("Hello",style: TextStyle(color: Colors.black),),
             Text("Hello",style: TextStyle(color: Colors.black),),
           ],
         )
        ],
        leading: Builder(
          builder: (context){
            return GestureDetector(
              child: roundedButton(),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Column(children: [

      ],),
    );
  }
}

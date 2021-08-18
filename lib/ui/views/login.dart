import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:nvme/router.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/widgets/customTextfieldWidget.dart';
import 'package:nvme/ui/widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodePassword = FocusNode();

  Widget roundedButton({
    IconData icon,
    Color color,
  }) {
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
            icon,
            size: hDimen(35),
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: hDimen(20),
          right: hDimen(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vSpacing(hDimen(40)),
            Container(
              height: hDimen(200),
              child: Image.asset(
                "assets/login.jpg",
                fit: BoxFit.cover,
              ),
            ),
            vSpacing(hDimen(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(MVVMRouter.ROUTE_REGISTER);
                  },
                  child: Text(
                    "NEW USER? SIGNUP NOW",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: hDimen(16),
                    ),
                  ),
                ),
              ],
            ),
            vSpacing(hDimen(40)),
            CustomTextfieldWidget(
              iconData: Icons.mail_outline,
              hintText: "Email Id or User Name",
              controller: _controllerEmail,
              focusNode: _nodeEmail,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            vSpacing(hDimen(20)),
            CustomTextfieldWidget(
              iconData: Icons.lock_open_outlined,
              hintText: "Password",
              controller: _controllerEmail,
              focusNode: _nodeEmail,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            vSpacing(hDimen(20)),
            CustomButton(buttonText: "LOGIN NOW", onClick: () {
              Navigator.of(context).pushReplacementNamed(MVVMRouter.ROUTE_DASHBOARD);
            }),
            vSpacing(hDimen(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "FORGOT PASSWORD?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(18),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    roundedButton(
                      color: Colors.blue,
                      icon: Entypo.facebook_circled,
                    ),
                    // hSpacing(hDimen(5)),
                    roundedButton(
                      color: Colors.redAccent,
                      icon: FontAwesome5.google_plus,
                    ),
                  ],
                ),
              ],
            ),
            vSpacing(hDimen(9)),
            Container(
              height: hDimen(150),
              width: double.infinity,
              child: Image.asset(
                "assets/blackNwhite.jpg",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}

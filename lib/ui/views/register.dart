import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:nvme/router.dart';
import 'package:nvme/ui/helper/app_dimen.dart';
import 'package:nvme/ui/helper/app_view_helper.dart';
import 'package:nvme/ui/widgets/customTextfieldWidget.dart';
import 'package:nvme/ui/widgets/custom_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPhoneNo = TextEditingController();

  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodePassword = FocusNode();
  FocusNode _nodePhoneNo = FocusNode();

  bool isRadioButtonActive = false;

  Widget radioButton({Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: hDimen(20),
        height: hDimen(20),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isRadioButtonActive ? Colors.green : Colors.grey[400],
            width: 1,
          ),
        ),
        child: isRadioButtonActive
            ? Center(
                child: Icon(
                  Icons.check,
                  size: hDimen(16),
                  color: Colors.green,
                ),
              )
            : Container(),
      ),
    );
  }

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
                  "SIGNUP",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(18),
                  ),
                ),
                Text(
                  "YOU HAVE AN ACC! LOGIN NOW",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: hDimen(15),
                  ),
                ),
              ],
            ),
            vSpacing(hDimen(20)),
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
              controller: _controllerPassword,
              focusNode: _nodePassword,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            vSpacing(hDimen(20)),
            CustomTextfieldWidget(
              iconData: Icons.lock_open_outlined,
              hintText: "Phone Number",
              controller: _controllerPhoneNo,
              focusNode: _nodePhoneNo,
              textInputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            vSpacing(hDimen(20)),
            CustomButton(buttonText: "SIGNUP", onClick: () {
              Navigator.of(context).pushReplacementNamed(MVVMRouter.ROUTE_LOG_IN);
            }),
            // vSpacing(hDimen(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    radioButton(onTap: () {
                      print(isRadioButtonActive);
                      setState(() {
                        isRadioButtonActive = !isRadioButtonActive;
                      });
                    }),
                    hSpacing(hDimen(5)),
                    Text(
                      "Accept Term & Condition",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(15),
                      ),
                    ),
                  ],
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
                )
              ],
            ),
            vSpacing(hDimen(15)),
            Container(
              height: hDimen(90),
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

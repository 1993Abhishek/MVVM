import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:nvme/ui/helper/app_colors.dart';
import 'package:nvme/ui/helper/app_dimen.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Color buttonColor;
  final double buttonRadius;
  final Function onClick;
  final double elevation;
  final Color borderSideColor;

  const CustomButton(
      {@required this.buttonText,
      this.buttonColor,
      @required this.onClick,
      this.textStyle,
      this.height,
      this.width,
      this.elevation = 3,
      this.borderSideColor,
      this.buttonRadius});

  Widget roundedButton() {
    return Container(
      height: hDimen(60),
      width: hDimen(60),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hDimen(50))),
        elevation: 2,
        child: Center(
          child: Icon(
            Linecons.paper_plane,
            size: hDimen(20),
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Stack(
        children: [
          Container(
            height: hDimen(60),
            padding: EdgeInsets.only(
              top: hDimen(5),
              bottom: hDimen(5),
              right: hDimen(5),
            ),
            child: Container(
              height: hDimen(44),
              // width: width == null ? hDimen(25) : width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.redAccent,
                        Colors.yellow,
                      ])),
              child: Center(
                child: Text(
                  buttonText,
                  style: textStyle,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: roundedButton(),
          ),
        ],
      ),
    );
  }
}

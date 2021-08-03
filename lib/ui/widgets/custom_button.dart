import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height == null ? hDimen(44) : height,
        width: width == null ? hDimen(25) : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color:buttonColor==null ? AppColor.colorPrimary : buttonColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

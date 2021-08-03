import 'package:flutter/material.dart';
import 'package:nvme/ui/helper/app_colors.dart';
import 'package:nvme/ui/helper/app_dimen.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> menuItem;
  final Color dropDownColor;
  final bool border;
  final String initialText;
  final Color iconColor;
  final Color fillCOlor;
  final Function onSelection;

  const CustomDropDown({
    Key key,
    this.menuItem,
    this.dropDownColor,
    @required this.border,
    @required this.initialText,
    this.fillCOlor,
    this.iconColor,
    this.onSelection,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String placeController;
  List<String> initSite = ["Kolkata", "Howrah", "Sundarban"];

  @override
  Widget build(BuildContext context) {
    if(widget.menuItem!=null){
      setState(() {
        initSite = widget.menuItem;
      });
    }
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          hDimen(10),
        ),
        side: widget.border
            ? BorderSide(
                color: Colors.black,
                width: 1.5,
              )
            : BorderSide(
                color: Colors.white70,
                width: 1.5,
              ),
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        itemHeight: hDimen(50),
        dropdownColor:widget.dropDownColor==null ? AppColor.colorTextFieldBorder :widget.dropDownColor,
        // elevation: 2,
        decoration: InputDecoration(
          helperMaxLines: 2,
          hintMaxLines: 2,
          fillColor: widget.fillCOlor==null? AppColor.colorTextFieldBorder : widget.fillCOlor,
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(hDimen(8)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(hDimen(8)),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          // enabled: true,

        ),
        value: placeController,
        icon: Icon(
          Icons.arrow_drop_down,
          color: widget.iconColor == null
              ? AppColor.colorPrimary
              : widget.iconColor,
        ),
        iconSize: hDimen(25),
        items: initSite
            .map(
              (lebel) => DropdownMenuItem(
                child: Text(
                  lebel,
                  style: TextStyle(
                    fontSize: hDimen(12),
                    fontFamily: "",
                    color: AppColor.colorPrimaryText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: lebel,
              ),
            )
            .toList(),
        hint: Text(
          widget.initialText,
          style: TextStyle(
            fontSize: hDimen(13),
            color: AppColor.colorPrimaryText,
          ),
        ),
        onChanged: (value) {
          setState(() {
            placeController = value;
          });
          widget.onSelection(value);
        },
      ),
    );
  }
}

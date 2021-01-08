import 'package:flutter_state_management_getx/resource/config/size_config.dart';
import 'package:flutter_state_management_getx/resource/constants/app_constants.dart';
import 'package:flutter_state_management_getx/resource/values/app_colors.dart';
import 'package:flutter/material.dart';

class CPDescriptionTextField extends StatefulWidget {
  String hintText;
  Function(String value) onChange;

  CPDescriptionTextField({this.hintText, this.onChange});

  @override
  _CPDescriptionTextFieldState createState() => _CPDescriptionTextFieldState();
}

class _CPDescriptionTextFieldState extends State<CPDescriptionTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (value) {
          widget.onChange(value);
        },
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontFamily: AppConfigurations.PRIMARY_FONT,
          fontWeight: AppConfigurations.FONT_WEIGHT_REGULAR,
          fontSize: 3.0 * SizeConfig.textMultiplier,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintStyle: TextStyle(
            fontFamily: AppConfigurations.PRIMARY_FONT,
            fontWeight: FontWeight.w500,
            fontSize: 2.5 * SizeConfig.textMultiplier,
            color: AppColors.LIGHT_GRAY_TEXT,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.LIGHT_GRAY_TEXT,
            ),
            //  when the TextFormField in unfocused
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.ultraLight),
            //  when the TextFormField in focused
          ),
          border: UnderlineInputBorder(),
          //to reduce the size of icon, use if you want. I used, because my custom font icon is big
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(left: 0, top: 12.0, right: 0, bottom: 10.0),
          //to make the base line of icon & text in same
        ));
  }
}

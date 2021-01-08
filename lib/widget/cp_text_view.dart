import 'package:flutter_state_management_getx/resource/constants/app_constants.dart';
import 'package:flutter_state_management_getx/resource/values/app_dimens.dart';
import 'package:flutter_state_management_getx/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CPTextView extends StatelessWidget {
  String text;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;
  final int textSize;
  final Color textColor;
  final bool underline;
  final TextAlign textAlign;
  final Key keyId;

  CPTextView({
    @required this.text,
    @optionalTypeArgs this.textSize,
    @optionalTypeArgs this.fontWeight,
    @optionalTypeArgs this.fontStyle,
    @optionalTypeArgs this.fontFamily,
    @optionalTypeArgs this.textColor,
    @optionalTypeArgs this.underline = false,
    @optionalTypeArgs this.textAlign,
    @optionalTypeArgs this.keyId
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: Get.width.toInt(), height: Get.height.toInt())
          ..init(context);
    return Text(text = this.text,
        key: this.keyId ?? Key(""),
        textAlign: this.textAlign ?? TextAlign.center,
        style: TextStyle(
            decoration: underline ? TextDecoration.underline : null,
            color: textColor ?? AppConfigurations.PRIMARY_TEXT_COLOR,
            fontSize: (textSize != null)
                ? ScreenUtil().setSp(textSize, true)
                : ScreenUtil().setSp(AppDimens.NUM_16, true),
            fontFamily: fontFamily ?? AppConfigurations.PRIMARY_FONT,
            fontWeight: fontWeight ?? AppConfigurations.FONT_WEIGHT_REGULAR,
            fontStyle: fontStyle ?? AppConfigurations.FONT_STYLE_NORMAL));
  }
}

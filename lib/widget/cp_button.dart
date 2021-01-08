import 'package:getx/resource/config/size_config.dart';
import 'package:getx/resource/constants/app_constants.dart';
import 'package:getx/resource/values/app_colors.dart';
import 'package:getx/widget/cp_text_view.dart';
import 'package:flutter/material.dart';

class CPButton extends StatelessWidget {
  Color textColor;
  Color btnBackgroundColor, btnDisableColor;
  double cornerRadius;
  String btnText;
  double elevation;
  double btnWidth;
  double btnHeight;
  Color borderColor;
  double marginTop;
  double marginBottom;
  double marginLeft;
  double marginRight;
  int textSize;
  FontWeight fontWeight;
  FontStyle fontStyle;
  GestureTapCallback onPressed;
  Key keyId;
  Key textKeyId;

  CPButton({
    @required this.btnText,
    @required this.textColor,
    @optionalTypeArgs this.textSize = 18,
    @required this.onPressed,
    @optionalTypeArgs this.cornerRadius = 5,
    @optionalTypeArgs this.btnBackgroundColor = AppColors.activeLight,
    @optionalTypeArgs this.btnWidth,
    @optionalTypeArgs this.btnHeight = 60,
    @optionalTypeArgs this.marginTop = 0,
    @optionalTypeArgs this.marginBottom = 0,
    @optionalTypeArgs this.elevation = 0,
    @optionalTypeArgs this.marginLeft = 0,
    @optionalTypeArgs this.marginRight = 0,
    @optionalTypeArgs this.fontWeight = AppConfigurations.FONT_WEIGHT_MEDIUM,
    @optionalTypeArgs this.fontStyle = AppConfigurations.FONT_STYLE_NORMAL,
    @optionalTypeArgs this.btnDisableColor,
    @optionalTypeArgs this.borderColor = AppColors.transparent,
    @optionalTypeArgs this.keyId,
    @optionalTypeArgs this.textKeyId,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight,
      ),
      width: btnWidth ?? MediaQuery.of(context).size.width,
      height: btnHeight,
      child: RaisedButton(
        key: keyId ?? Key(""),
        onPressed: onPressed,
        elevation: elevation,
        color: btnBackgroundColor,
        child: Container(
          child: CPTextView(
            keyId: textKeyId ?? Key(""),
            textColor: textColor,
            text: btnText,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            textSize: textSize,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              cornerRadius,
            ),
            side: BorderSide(
              color: borderColor,
            )),
      ),
    );
  }
}

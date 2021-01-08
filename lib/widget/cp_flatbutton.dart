import 'package:getx/resource/config/size_config.dart';
import 'package:getx/resource/constants/app_constants.dart';
import 'package:getx/resource/values/app_dimens.dart';
import 'package:getx/widget/cp_text_view.dart';
import 'package:flutter/material.dart';

class CPFlatButton extends StatelessWidget {
  Color textColor;
  Color btnBackgroundColor;
  double cornerRadius;
  String btnText;
  double btnWidth;
  double btnHeight;
  String imagePath;
  double borderWidth;

  double marginTop;
  double marginBottom;
  double marginLeft;
  double marginRight;
  double textSize;
  Color borderColor;
  GestureTapCallback onPressed;

  CPFlatButton({
    @required this.btnText,
    @required this.textColor,
    @optionalTypeArgs this.textSize,
    @required this.onPressed,
    @optionalTypeArgs this.cornerRadius,
    @optionalTypeArgs this.btnBackgroundColor,
    @optionalTypeArgs this.btnWidth,
    @optionalTypeArgs this.btnHeight,
    @optionalTypeArgs this.marginTop,
    @optionalTypeArgs this.marginBottom,
    @optionalTypeArgs this.borderColor,
    @optionalTypeArgs this.marginLeft,
    @optionalTypeArgs this.marginRight,
    @optionalTypeArgs this.imagePath,
    @optionalTypeArgs this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: marginTop ?? AppDimens.NUM_0.toDouble(),
        bottom: marginBottom ?? AppDimens.NUM_0.toDouble(),
        left: marginLeft ?? AppDimens.NUM_0.toDouble(),
        right: marginRight ?? AppDimens.NUM_0.toDouble(),
      ),
      width: btnWidth ?? MediaQuery.of(context).size.width,
      height: btnHeight ?? AppDimens.NUM_60.toDouble(),
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          child: imagePath == null
              ? CPTextView(
                  textColor: textColor,
                  text: btnText,
                  fontWeight: AppConfigurations.FONT_WEIGHT_MEDIUM,
                  textSize: textSize ?? AppDimens.NUM_18,
                )
              : Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 100 * AppDimens.NUM_6,
                        height: 20,
                        child: Image.asset(imagePath)),
                    Container(
                      width: MediaQuery.of(context).size.width / 100 * AppDimens.NUM_15,
                      height: 20,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 100 * AppDimens.NUM_2,
                      ),
                      child: CPTextView(
                        textColor: textColor,
                        text: btnText,
                        fontWeight: AppConfigurations.FONT_WEIGHT_BOLD,
                        textSize: textSize ?? AppDimens.NUM_16,
                      ),
                    )
                  ],
                ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            cornerRadius ?? AppDimens.NUM_5.toDouble(),
          ),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: this.borderWidth,
          ),
        ),
      ),
    );
  }
}

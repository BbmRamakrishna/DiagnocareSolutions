import 'package:flutter_state_management_getx/resource/config/size_config.dart';
import 'package:flutter_state_management_getx/resource/constants/app_constants.dart';
import 'package:flutter_state_management_getx/resource/values/app_colors.dart';
import 'package:flutter_state_management_getx/resource/values/app_dimens.dart';
import 'package:flutter_state_management_getx/widget/cp_text_view.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final String title, rightText;
  final String leftImage;
  final String rightImage;
  final Size preferredSize;
  final String titleImagePath;

  final Color titleColor;
  final Color backGroundColor;

  final Function leftButtonPressed;
  final Function rightButtonPressed;
  final Function rightTextPressed;

  CustomAppBar(
      {@optionalTypeArgs this.title,
        @optionalTypeArgs this.leftImage = '',
        @optionalTypeArgs this.rightImage = "",
        @optionalTypeArgs this.backGroundColor = Colors.transparent,
        @optionalTypeArgs this.titleColor = AppColors.regular,
        @optionalTypeArgs this.titleImagePath = '',
        @optionalTypeArgs this.rightText = "",
        this.leftButtonPressed,
        this.rightButtonPressed,
        this.rightTextPressed})
      : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title:
      this.titleImagePath.isEmpty ? this.textWidget() : this.imageWidget(),
      backgroundColor: backGroundColor,
      elevation: 0,
      brightness: Brightness.light,
      leading: this.leftImage.isNotEmpty
          ? FlatButton(
        padding:  EdgeInsets.only(left: 27),
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: this.leftButtonPressed,
        child: Image(
          image: AssetImage(this.leftImage),
        ),
      )
          : null,
      actions: this.rightImage.isNotEmpty
          ? [imageAction()]
          : rightText.isNotEmpty ? [textAction()] : null,
    );
  }

  Widget imageAction() {
    return FlatButton(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: this.rightButtonPressed,
      child: Container(
        width: 32,
        height: 32,
        child: Center(
          child: Image(
            image: AssetImage(this.rightImage),
          ),
        ),
      ),
    );
  }

  Widget textAction() {
    return Container(
      margin: EdgeInsets.only(right: 2.4 * SizeConfig.widthMultiplier),
      child: Center(
        child: GestureDetector(
          onTap: rightTextPressed,
          child: CPTextView(
            text: rightText,
            textColor: AppColors.activeLight,
            fontWeight: AppConfigurations.FONT_WEIGHT_BOLD,
          ),
        ),
      ),
    );
  }

  Widget textWidget() {
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(
        title,
        style: TextStyle(
            color: titleColor,
            fontFamily: CPFont.family,
            fontWeight: CPFont.w700,
            fontSize: AppDimens.NUM_16.toDouble()),
      ),
    );
  }

  Widget imageWidget() {
    return Image.asset(
      this.titleImagePath,
      fit: BoxFit.fitHeight,
      height: 21,
    );
  }
}

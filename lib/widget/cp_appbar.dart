import 'package:diagnocare_solutions/resource/config/size_config.dart';
import 'package:diagnocare_solutions/resource/constants/app_constants.dart';
import 'package:diagnocare_solutions/resource/values/app_colors.dart';
import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';

import 'cp_text_view.dart';

class CPAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final String title, rightText;
  final double titleTextSize, rightTextSize;
  final String leftImage;
  final String rightImage;
  final double rightImageWidth;
  final double rightImageHeight;
  final double leftImageWidth;
  final double leftImageHeight;
  final double centerImageWidth;
  final double centerImageHeight;
  final Size preferredSize;
  final String titleImagePath;
  final Color titleColor;
  final Color backGroundColor;
  final Function leftButtonPressed;
  final Function rightButtonPressed;
  final Function rightTextPressed;
  final double leftSpacing;
  final double rightSpacing;
  final double topSpacing;
  final double bottomSpacing;

  CPAppBar(
      {@optionalTypeArgs this.title,
      @optionalTypeArgs this.titleTextSize = 0,
      @optionalTypeArgs this.rightTextSize = 0,
      @optionalTypeArgs this.leftImage = '',
      @optionalTypeArgs this.rightImage = "",
      @optionalTypeArgs this.backGroundColor = Colors.transparent,
      @optionalTypeArgs this.titleColor = AppColors.regular,
      @optionalTypeArgs this.titleImagePath = '',
      @optionalTypeArgs this.rightText = "",
      @optionalTypeArgs this.rightImageWidth = 0,
      @optionalTypeArgs this.rightImageHeight = 0,
      @optionalTypeArgs this.leftImageWidth = 0,
      @optionalTypeArgs this.leftImageHeight = 0,
      @optionalTypeArgs this.centerImageWidth = 0,
      @optionalTypeArgs this.centerImageHeight = 0,
      @optionalTypeArgs this.leftSpacing = 0,
      @optionalTypeArgs this.rightSpacing = 0,
      @optionalTypeArgs this.topSpacing = 0,
      @optionalTypeArgs this.bottomSpacing = 0,
      this.leftButtonPressed,
      this.rightButtonPressed,
      this.rightTextPressed})
      : preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: this.topSpacing != null && this.topSpacing != 0 ? this.topSpacing : AppDimens.NUM_50.toDouble(),
          left: this.leftSpacing != null && this.leftSpacing != 0 ? this.leftSpacing : AppDimens.NUM_27.toDouble(),
          right: this.rightSpacing != null && this.rightSpacing != 0 ? this.rightSpacing : AppDimens.NUM_27.toDouble(),
          bottom: this.bottomSpacing != null && this.bottomSpacing != 0 ? this.bottomSpacing : 0),
      child: Row(
        children: [
          this.leftImage.isNotEmpty
              ? InkWell(
                  highlightColor: Colors.transparent,
                  onTap: this.leftButtonPressed,
                  child: Container(
                    key: Key('cp_appbar_left_icon'),
                    child: Image(
                      image: AssetImage(this.leftImage),
                      width: this.leftImageWidth != null && this.leftImageWidth != 0
                          ? leftImageWidth
                          : AppDimens.NUM_24.toDouble(),
                      height: this.leftImageHeight != null && this.leftImageHeight != 0
                          ? leftImageHeight
                          : AppDimens.NUM_14.toDouble(),
                    ),
                  ),
                )
              : SizedBox(
                  width: AppDimens.NUM_24.toDouble(),
                  height: AppDimens.NUM_14.toDouble(),
                ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: this.titleImagePath.isEmpty ? this.textWidget() : this.imageWidget(),
            ),
          ),
          this.rightImage.isNotEmpty
              ? imageAction()
              : rightText.isNotEmpty
                  ? textAction()
                  : SizedBox(
                      width: AppDimens.NUM_24.toDouble(),
                      height: AppDimens.NUM_14.toDouble(),
                    ),
        ],
      ),
    );
  }

  Widget imageAction() {
    return InkWell(
      onTap: this.rightButtonPressed,
      highlightColor: Colors.transparent,
      child: Container(
        key: Key('cp_appbar_right_icon'),
        child: Center(
          child: Image(
            image: AssetImage(this.rightImage),
            width: rightImageWidth != null && rightImageWidth != 0 ? rightImageWidth : 32,
            height: rightImageHeight != null && rightImageHeight != 0 ? rightImageHeight : 32,
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
          child: Container(
            key: Key('cp_appbar_right_text'),
            child: CPTextView(
              text: rightText,
              textColor: AppColors.activeLight,
              fontWeight: AppConfigurations.FONT_WEIGHT_BOLD,
              textSize: rightTextSize != null && rightTextSize != 0
                  ? rightTextSize
                  : 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget textWidget() {
    return Container(
      key: Key('cp_appbar_center_text'),
      child: Text(
        title ?? '',
        style: TextStyle(
            color: titleColor ?? AppColors.activeLight,
            fontFamily: CPFont.family,
            fontWeight: CPFont.w700,
            fontSize: titleTextSize != null && titleTextSize != 0 ? titleTextSize : AppDimens.NUM_16.toDouble()),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      key: Key('cp_appbar_center_image'),
      child: Image.asset(
        this.titleImagePath,
        fit: BoxFit.fitHeight,
        height: this.centerImageHeight != null && this.centerImageHeight != 0 ? centerImageHeight : 21,
        width: this.centerImageWidth != null && this.centerImageWidth != 0 ? centerImageWidth : 82,
      ),
    );
  }
}

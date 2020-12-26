import 'package:diagnocare_solutions/resource/constants/app_constants.dart';
import 'package:diagnocare_solutions/resource/values/app_colors.dart';
import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:diagnocare_solutions/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class CPTextButton extends StatefulWidget {
  final bool isEnabled;
  final String title;
  final Function onPressed;
  final double width;

  CPTextButton({
    this.title,
    this.onPressed,
    this.isEnabled = true,
    this.width,
  })  : assert(onPressed != null, 'Please subscribe to onPressed action for CPNormalButton'),
        assert(title != null, 'Title cannot be null for a CPNormalButton.');

  @override
  _CPTextButtonState createState() => _CPTextButtonState();
}

class _CPTextButtonState extends State<CPTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        height: AppDimens.NUM_60.toDouble(),
        width: widget.width,
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: CPFont.family,
              fontWeight: CPFont.w700,
              color: textColor(),
              fontSize: ScreenUtil().setSp(AppDimens.NUM_18, true),
            ),
          ),
        ),
      ),
    );
  }

  Color backgroundColor() {
    return widget.isEnabled ? AppColors.activeLight : AppColors.GREY;
  }

  Color textColor() {
    return AppColors.WHITE_COLOR;
  }
}

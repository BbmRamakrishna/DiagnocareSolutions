import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';

class CPBackground extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final String imagePath;
  bool isDotsVisible;
  Color backgroundColor;
  double leftSpacing;

  CPBackground({
    this.imagePath,
    this.width,
    this.height,
    this.leftSpacing = 0,
    this.child,
    @optionalTypeArgs this.isDotsVisible,
    @optionalTypeArgs this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor == null ? Colors.white : backgroundColor),
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: isDotsVisible == null ? true : isDotsVisible,
            child: Positioned(
              top: AppDimens.NUM_0.toDouble(),
              left: this.leftSpacing,
              child: Image.asset(
                this.imagePath,
                width: this.width,
                height: this.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ShadowEffect extends StatelessWidget {
  final Widget child;
  final Color firstColor;
  final Color secondColor;
  final PositionedGradient position;

  ShadowEffect({
    this.child,
    this.firstColor,
    this.secondColor,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        this.child,
        this.position,
      ],
    );
  }
}

class PositionedGradient extends StatelessWidget {
  final Color first;
  final Color second;
  final double height;
  final double bottom;

  const PositionedGradient({
    this.first,
    this.second,
    this.height,
    @optionalTypeArgs this.bottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: this.bottom == null ? 0 : this.bottom,
      width: MediaQuery.of(context).size.width,
      height: this.height,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              this.first,
              this.second,
            ],
          ),
        ),
      ),
    );
  }
}

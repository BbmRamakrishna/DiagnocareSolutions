import 'package:flutter/material.dart';

// Use this button when button contains only image and no text.
class CPImageButton extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final Function onPressed;

  CPImageButton({this.width, this.height, this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: this.width,
        height: this.height,
        child: Center(
          child: Image.asset(this.imagePath),
        ),
      ),
    );
  }
}

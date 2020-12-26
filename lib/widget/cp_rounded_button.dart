import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CPRoundedButton extends StatefulWidget {
  @override
  _CPRoundedButtonState createState() => _CPRoundedButtonState();
}

class _CPRoundedButtonState extends State<CPRoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFF05A22),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "BUTTON",
                  style: TextStyle(
                    color: Color(0xFFF05A22),
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

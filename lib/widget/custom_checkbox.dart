import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCheckBox extends StatefulWidget {
  bool isChecked;
  String checkBoxText;
  Function(bool) onChanged;

  CustomCheckBox({this.isChecked, this.checkBoxText, this.onChanged}) ;

  @override
  CustomCheckBoxState createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  var isSelected = false;
  var checkboxtxt = "";

  @override
  void initState() {
    isSelected = widget.isChecked ?? false;
    checkboxtxt =
        widget.checkBoxText ?? 'I agree to all the Terms and Conditions';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // isSelected = widget.isChecked ?? false;

    var blockWidthOfScreen = MediaQuery.of(context).size.width / 100;

    print('======block width=====$blockWidthOfScreen');

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isChecked = isSelected;
          widget.onChanged(isSelected);
        });
      },
      child: AnimatedContainer(
          margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          color: Color(0xFFF6F7F8),
          duration: Duration(microseconds: 100),
          curve: Curves.fastLinearToSlowEaseIn,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Row(children: [
              ConstrainedBox(
                constraints: new BoxConstraints(
                ),
                child: isSelected
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: Stack(children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            width: blockWidthOfScreen * AppDimens.PERCENTAGE_59.toDouble(),
                            height: blockWidthOfScreen * AppDimens.PERCENTAGE_59.toDouble(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                border:
                                    Border.all(color: Colors.grey, width: 2.0)),
                            // margin: EdgeInsets.only(left: blockWidthOfScreen * AppDimens.PERCENTAGE_4723.toDouble(), top: 0, right: 0),
                          ),
                          new Positioned(
                              left: blockWidthOfScreen * AppDimens.PERCENTAGE_118.toDouble(),
                              top: blockWidthOfScreen * AppDimens.PERCENTAGE_118.toDouble(),
                              child: new Container(
                                alignment: Alignment.centerLeft,
                                width: blockWidthOfScreen * AppDimens.PERCENTAGE_355.toDouble(),
                                height: blockWidthOfScreen * AppDimens.PERCENTAGE_355.toDouble(),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(3.0)),
                                // margin:
                                    // EdgeInsets.only(left: blockWidthOfScreen * AppDimens.PERCENTAGE_4723.toDouble(), top: 0, right: 0),
                              ))
                        ]),
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: blockWidthOfScreen * AppDimens.PERCENTAGE_59.toDouble(),
                        height: blockWidthOfScreen * AppDimens.PERCENTAGE_59.toDouble(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.all(color: Colors.grey, width: 2.0)),
                        // margin: EdgeInsets.only(left: blockWidthOfScreen * AppDimens.PERCENTAGE_4723.toDouble(), top: 0, right: 0),
                      ),
              ),
              Container(
                child: Text(
                  "$checkboxtxt",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 14.0),
                ),
                margin: EdgeInsets.only(left: blockWidthOfScreen * AppDimens.PERCENTAGE_355.toDouble()
                    , top: 0, right: 0),
              )
            ]);
          })),
    );
  }

}

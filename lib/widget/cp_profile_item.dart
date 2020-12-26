import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';

import 'cp_text_view.dart';

// ignore: must_be_immutable
class CPProfileItem extends StatelessWidget {
  var text1;
  var textSize1;
  var fontWeight1;
  var textColor1;

  var text2;
  var textSize2;
  var fontWeight2;
  var textColor2;
  Key keyId;

  CPProfileItem({
    @required this.text1,
    @optionalTypeArgs this.textSize1,
    @optionalTypeArgs this.fontWeight1,
    @optionalTypeArgs this.textColor1,
    @required this.text2,
    @optionalTypeArgs this.textSize2,
    @optionalTypeArgs this.fontWeight2,
    @optionalTypeArgs this.textColor2,
    @optionalTypeArgs this.keyId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppDimens.NUM_16.toDouble(),
          bottom: AppDimens.NUM_16.toDouble()),
      child: Row(
        key: this.keyId ?? Key(""),
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: CPTextView(
              text: text1,
              textColor: textColor1,
              fontWeight: fontWeight1,
              textSize: textSize1,
            ),
          )),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: CPTextView(
                text: text2,
                textColor: textColor2,
                fontWeight: fontWeight2,
                textSize: textSize2,
                textAlign: TextAlign.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}

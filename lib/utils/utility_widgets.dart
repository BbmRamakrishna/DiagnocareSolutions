import 'package:getx/resource/config/size_config.dart';
import 'package:flutter/cupertino.dart';
Widget sizedBoxHeight(int i) {
  return SizedBox(
    height: SizeConfig.blockSizeVertical*i,
  );
}
Widget sizedBoxWidth(int i) {
  return SizedBox(
    width: SizeConfig.blockSizeHorizontal*i,
  );
}



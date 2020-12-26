import 'package:diagnocare_solutions/resource/constants/app_constants.dart';
import 'package:diagnocare_solutions/resource/values/app_colors.dart';
import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:diagnocare_solutions/resource/values/app_strings.dart';
import 'package:diagnocare_solutions/resource/values/res.dart';
import 'package:diagnocare_solutions/utils/utility_widgets.dart';
import 'package:diagnocare_solutions/widget/cp_appbar.dart';
import 'package:diagnocare_solutions/widget/cp_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnocareTaskScreen extends StatefulWidget {
  @override
  DiagnocareTaskScreenState createState() => DiagnocareTaskScreenState();
}

class DiagnocareTaskScreenState extends State<DiagnocareTaskScreen> {

  @override
  void initState() {
    callApis();
    super.initState();
  }

  Future<void> callApis() async {
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: Key("Scaffold Key in Agent or Merchant Locator"),
      appBar: CPAppBar(
        backGroundColor: Colors.transparent,
        title: AppStrings.APP_NAME,
        leftButtonPressed: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.WHITE_COLOR,
      body: GetBuilder(
        builder: (_) {
          return SafeArea(
            child: Container(
              child: Column(children: [
                sizedBoxHeight(AppDimens.NUM_3),
                Container(
                  padding: EdgeInsets.only(
                      left: AppDimens.NUM_27.toDouble(),
                      right: AppDimens.NUM_27.toDouble()),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_73.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor: AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          textSize: AppDimens.NUM_14,
                          btnBackgroundColor: AppColors.accent,
                          btnText: AppStrings.ShowTwoItems,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                          },
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: sizedBoxWidth(AppDimens.NUM_3)
                      ),
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor: AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor: AppColors.accent,
                          btnText: AppStrings.ShowThreeItems,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                          },
                        ),
                      ),
                      Expanded(
                        flex: 5,
                          child: sizedBoxWidth(AppDimens.NUM_3)
                      ),
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor: AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor: AppColors.accent,
                          btnText: AppStrings.ShowList,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );


  }
}

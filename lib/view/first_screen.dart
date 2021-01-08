import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_state_management_getx/resource/constants/app_constants.dart';
import 'package:flutter_state_management_getx/resource/values/app_colors.dart';
import 'package:flutter_state_management_getx/resource/values/app_dimens.dart';
import 'package:flutter_state_management_getx/resource/values/app_strings.dart';
import 'package:flutter_state_management_getx/utils/utility_widgets.dart';
import 'package:flutter_state_management_getx/view/first_screen_controller.dart';
import 'package:flutter_state_management_getx/view/first_screen_viewmodel.dart';
import 'package:flutter_state_management_getx/widget/cp_appbar.dart';
import 'package:flutter_state_management_getx/widget/cp_button.dart';
import 'package:flutter_state_management_getx/widget/cp_text_view.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  FirstScreenViewModel firstScreenViewModel;
  FirstScreenController firstScreenController;

  @override
  void initState() {
    Get.put(FirstScreenController());
    firstScreenController = Get.find<FirstScreenController>();
    firstScreenViewModel = FirstScreenViewModel(firstScreenController);
    super.initState();
  }

  Future<void> callApis() async {
    await firstScreenViewModel.apiCallForDiagnocareResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CPAppBar(
        backGroundColor: Colors.transparent,
        title: AppStrings.APP_NAME,
        leftButtonPressed: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.WHITE_COLOR,
      body: GetBuilder(
        init: firstScreenController,
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
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor:
                              (firstScreenController.showTwoListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (firstScreenController.showTwoListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowTwoItems,
                          textSize: AppDimens.NUM_14,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            firstScreenController.setTwoListButtonClick();
                          },
                        ),
                      ),
                      Expanded(flex: 5, child: sizedBoxWidth(AppDimens.NUM_3)),
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor:
                              (firstScreenController.showThreeListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (firstScreenController.showThreeListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowThreeItems,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            firstScreenController.setThreeListButtonClick();
                          },
                        ),
                      ),
                      Expanded(flex: 5, child: sizedBoxWidth(AppDimens.NUM_3)),
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor:
                              (firstScreenController.showListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (firstScreenController.showListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowList,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            firstScreenController.setListButtonClick();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                sizedBoxHeight(AppDimens.NUM_3),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      left: AppDimens.NUM_27.toDouble(),
                      right: AppDimens.NUM_27.toDouble()),
                  child: CPTextView(
                    keyId: Key("Results Size"),
                    text: (getItemCount() == 1)
                        ? "${getItemCount()} ${AppStrings.Result_found}"
                        : "${getItemCount()} ${AppStrings.Results_found}",
                    fontWeight: CPFont.w400,
                    textSize: AppDimens.NUM_14,
                    textColor: AppColors.PRIMARY_TEXT_COLOR,
                  ),
                ),
                sizedBoxHeight(AppDimens.NUM_3),
                (firstScreenController.diagnocareSolutionsResponse.length >
                        AppDimens.NUM_0)
                    ? fetchListData()
                    : Container()
              ]),
            ),
          );
        },
      ),
    );
  }

  ListTile _listTileForDiagnocare(
      String title, String subtitle, String serverImage) {
    return ListTile(
      leading: CircleAvatar(
        key: Key("Server Icon in List Data"),
        radius: 30.0,
        backgroundImage: NetworkImage(serverImage),
        // child: Image.network(serverImage),
      ),
      title: Text(title,
          key: Key("Title List Data Text"),
          style: TextStyle(
              color: AppColors.activeLight,
              fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
              fontSize: AppDimens.NUM_16.toDouble(),
              fontWeight: CPFont.w700)),
      subtitle: Text(subtitle,
          key: Key("Sub Title List Data Text"),
          style: TextStyle(
              color: AppColors.light,
              fontWeight: CPFont.w500,
              fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
              fontSize: AppDimens.NUM_14.toDouble())),
    );
  }

  int getItemCount() {
    if (firstScreenController.diagnocareSolutionsResponse.length > 0) {
      if (firstScreenController.showTwoListButtonSelected) {
        return AppDimens.NUM_2;
      } else if (firstScreenController.showThreeListButtonSelected) {
        return AppDimens.NUM_3;
      } else {
        return firstScreenController.diagnocareSolutionsResponse.length;
      }
    } else {
      return 0;
    }
  }

  Expanded fetchListData() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: AppDimens.NUM_11.toDouble(),
              right: AppDimens.NUM_11.toDouble()),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getItemCount(),
                  itemBuilder: (BuildContext buildContext, int index) {
                    return _listTileForDiagnocare(
                      firstScreenController.listResponse.list[index].login ?? "",
                      getDescription(index),
                      firstScreenController.listResponse.list[index].avatarUrl ??
                          "",
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  String getDescription(int index) {
    if (firstScreenController.listResponse.list[index].description == null) {
      return "Description Not Availble";
    } else if (firstScreenController
            .listResponse.list[index].description.length ==
        AppDimens.NUM_0) {
      return "Description Not Availble";
    } else {
      return firstScreenController.listResponse.list[index].description;
    }
  }
}

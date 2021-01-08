import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/resource/constants/app_constants.dart';
import 'package:getx/resource/values/app_colors.dart';
import 'package:getx/resource/values/app_dimens.dart';
import 'package:getx/resource/values/app_strings.dart';
import 'package:getx/utils/utility_widgets.dart';
import 'package:getx/view/getx_screen_controller.dart';
import 'package:getx/view/getx_screen_viewmodel.dart';
import 'package:getx/widget/cp_appbar.dart';
import 'package:getx/widget/cp_button.dart';
import 'package:getx/widget/cp_text_view.dart';

class GetxScreen extends StatefulWidget {
  @override
  GetxScreenState createState() => GetxScreenState();
}

class GetxScreenState extends State<GetxScreen> {
  GetxScreenViewModel getxScreenViewModel;
  GetxScreenController getxScreenController;

  @override
  void initState() {
    Get.put(GetxScreenController());
    getxScreenController = Get.find<GetxScreenController>();
    getxScreenViewModel = GetxScreenViewModel(getxScreenController);
    super.initState();
  }

  Future<void> callApis() async {
    await getxScreenViewModel.apiCallForDiagnocareResponse();
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
        init: getxScreenController,
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
                              (getxScreenController.showTwoListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (getxScreenController.showTwoListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowTwoItems,
                          textSize: AppDimens.NUM_14,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            getxScreenController.setTwoListButtonClick();
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
                              (getxScreenController.showThreeListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (getxScreenController.showThreeListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowThreeItems,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            getxScreenController.setThreeListButtonClick();
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
                              (getxScreenController.showListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (getxScreenController.showListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowList,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            getxScreenController.setListButtonClick();
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
                (getxScreenController.diagnocareSolutionsResponse.length >
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
    if (getxScreenController.diagnocareSolutionsResponse.length > 0) {
      if (getxScreenController.showTwoListButtonSelected) {
        return AppDimens.NUM_2;
      } else if (getxScreenController.showThreeListButtonSelected) {
        return AppDimens.NUM_3;
      } else {
        return getxScreenController.diagnocareSolutionsResponse.length;
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
                      getxScreenController.listResponse.list[index].login ?? "",
                      getDescription(index),
                      getxScreenController.listResponse.list[index].avatarUrl ??
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
    if (getxScreenController.listResponse.list[index].description == null) {
      return "Description Not Availble";
    } else if (getxScreenController
            .listResponse.list[index].description.length ==
        AppDimens.NUM_0) {
      return "Description Not Availble";
    } else {
      return getxScreenController.listResponse.list[index].description;
    }
  }
}

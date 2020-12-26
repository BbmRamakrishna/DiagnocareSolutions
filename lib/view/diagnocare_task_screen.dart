import 'package:diagnocare_solutions/resource/constants/app_constants.dart';
import 'package:diagnocare_solutions/resource/values/app_colors.dart';
import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:diagnocare_solutions/resource/values/app_strings.dart';
import 'package:diagnocare_solutions/utils/utility_widgets.dart';
import 'package:diagnocare_solutions/view/diagnocare_task_controller.dart';
import 'package:diagnocare_solutions/view/diagnocare_task_viewmodel.dart';
import 'package:diagnocare_solutions/widget/cp_appbar.dart';
import 'package:diagnocare_solutions/widget/cp_button.dart';
import 'package:diagnocare_solutions/widget/cp_text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnocareTaskScreen extends StatefulWidget {
  @override
  DiagnocareTaskScreenState createState() => DiagnocareTaskScreenState();
}

class DiagnocareTaskScreenState extends State<DiagnocareTaskScreen> {
  DiagnocareTaskViewModel diagnocareTaskViewModel;
  DiagnocareTaskController diagnocareTaskController;

  @override
  void initState() {
    Get.put(DiagnocareTaskController());
    diagnocareTaskController = Get.find<DiagnocareTaskController>();
    diagnocareTaskViewModel = DiagnocareTaskViewModel(diagnocareTaskController);
    super.initState();
  }

  Future<void> callApis() async {
    await diagnocareTaskViewModel.apiCallForDiagnocareResponse();
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
        init: diagnocareTaskController,
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
                          textColor: (diagnocareTaskController
                                  .showTwoListButtonSelected)
                              ? AppColors.WHITE_COLOR
                              : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor: (diagnocareTaskController
                                  .showTwoListButtonSelected)
                              ? AppColors.activeLight
                              : AppColors.accent,
                          btnText: AppStrings.ShowTwoItems,
                          textSize: AppDimens.NUM_14,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            diagnocareTaskController.setTwoListButtonClick();
                          },
                        ),
                      ),
                      Expanded(flex: 5, child: sizedBoxWidth(AppDimens.NUM_3)),
                      Expanded(
                        flex: 30,
                        child: CPButton(
                          btnWidth: AppDimens.NUM_94.toDouble(),
                          btnHeight: AppDimens.NUM_40.toDouble(),
                          textColor: (diagnocareTaskController
                                  .showThreeListButtonSelected)
                              ? AppColors.WHITE_COLOR
                              : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor: (diagnocareTaskController
                                  .showThreeListButtonSelected)
                              ? AppColors.activeLight
                              : AppColors.accent,
                          btnText: AppStrings.ShowThreeItems,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            diagnocareTaskController.setThreeListButtonClick();
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
                              (diagnocareTaskController.showListButtonSelected)
                                  ? AppColors.WHITE_COLOR
                                  : AppColors.BLACK,
                          marginBottom: AppDimens.NUM_35.toDouble(),
                          btnBackgroundColor:
                              (diagnocareTaskController.showListButtonSelected)
                                  ? AppColors.activeLight
                                  : AppColors.accent,
                          btnText: AppStrings.ShowList,
                          borderColor: AppColors.LIGHT_GRAY,
                          fontStyle: AppConfigurations.FONT_STYLE_NORMAL,
                          textSize: AppDimens.NUM_14,
                          fontWeight: CPFont.w500,
                          onPressed: () {
                            callApis();
                            diagnocareTaskController.setListButtonClick();
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
                (diagnocareTaskController.diagnocareSolutionsResponse.length >
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
    if (diagnocareTaskController.diagnocareSolutionsResponse.length > 0) {
      if (diagnocareTaskController.showTwoListButtonSelected) {
        return AppDimens.NUM_2;
      } else if (diagnocareTaskController.showThreeListButtonSelected) {
        return AppDimens.NUM_3;
      } else {
        return diagnocareTaskController.diagnocareSolutionsResponse.length;
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
                      diagnocareTaskController.listResponse.list[index].login ??
                          "",
                      getDescription(index),
                      diagnocareTaskController
                              .listResponse.list[index].avatarUrl ??
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
    if (diagnocareTaskController.listResponse.list[index].description == null) {
      return "Description Not Availble";
    } else if (diagnocareTaskController
            .listResponse.list[index].description.length ==
        AppDimens.NUM_0) {
      return "Description Not Availble";
    } else {
      return diagnocareTaskController.listResponse.list[index].description;
    }
  }
}

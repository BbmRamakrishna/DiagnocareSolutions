
import 'package:flutter_state_management_getx/network/response/dummy_response.dart';
import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  List<dynamic> diagnocareSolutionsResponse = [];
  DummyResponse listResponse;
  var showTwoListButtonSelected = false;
  var showThreeListButtonSelected = false;
  var showListButtonSelected = false;

  void setDiagnocareResponse(List<dynamic> response) {
    diagnocareSolutionsResponse = response;
    listResponse = DummyResponse.fromJson(diagnocareSolutionsResponse);
    update();
    checkFormValid();
  }

  void setTwoListButtonClick(){
    showTwoListButtonSelected = !showTwoListButtonSelected;
    showThreeListButtonSelected = false;
    showListButtonSelected = false;
    update();
    checkFormValid();
  }

  void setThreeListButtonClick(){
    showThreeListButtonSelected = !showThreeListButtonSelected;
    showTwoListButtonSelected = false;
    showListButtonSelected = false;
    update();
    checkFormValid();
  }

  void setListButtonClick(){
    showListButtonSelected = !showListButtonSelected;
    showTwoListButtonSelected = false;
    showThreeListButtonSelected = false;
    update();
    checkFormValid();
  }

  void checkFormValid() {

    print("==Two List Button Selected==$showTwoListButtonSelected");
    print("==Three List Button Selected==$showThreeListButtonSelected");
    print("==List Button Selected==$showListButtonSelected");

  }

}

import 'package:get/get.dart';
import 'package:getx/network/nao/first_screen_nao.dart';
import 'package:getx/view/first_screen_controller.dart';

class FirstScreenViewModel {
  FirstScreenController firstScreenController;

  FirstScreenViewModel(this.firstScreenController);

  Future<List<dynamic>> apiCallForDiagnocareResponse() async {
    dynamic response = await FirstScreenNao().diagnocareRes();
    if (response != null) {
      Get.snackbar("Diagnal Solutions Response", "Passed");
      firstScreenController.setDiagnocareResponse(response);
    } else {
      Get.snackbar("Diagnal Solutions Response", "Failed");
    }
  }
}

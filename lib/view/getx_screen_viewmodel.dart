import 'package:get/get.dart';
import 'package:getx/network/nao/getx_screen_nao.dart';
import 'package:getx/view/getx_screen_controller.dart';

class GetxScreenViewModel {
  GetxScreenController getxScreenController;

  GetxScreenViewModel(this.getxScreenController);

  Future<List<dynamic>> apiCallForDiagnocareResponse() async {
    dynamic response = await GetxScreenNao().diagnocareRes();
    if (response != null) {
      Get.snackbar("Diagnal Solutions Response", "Passed");
      getxScreenController.setDiagnocareResponse(response);
    } else {
      Get.snackbar("Diagnal Solutions Response", "Failed");
    }
  }
}

import 'package:diagnocare_solutions/network/nao/diagnocare_nao.dart';
import 'package:diagnocare_solutions/network/response/diagnocare_solutions_response.dart';
import 'package:diagnocare_solutions/view/diagnocare_task_controller.dart';
import 'package:get/get.dart';

class DiagnocareTaskViewModel {
  DiagnocareTaskController diagnocareTaskController;

  DiagnocareTaskViewModel(this.diagnocareTaskController);

  Future<List<dynamic>> apiCallForDiagnocareResponse() async {
       dynamic response = await DiagnocareNao().diagnocareRes();
       if(response != null){
         Get.snackbar("Diagnal Solutions Response", "Passed");
         diagnocareTaskController.setDiagnocareResponse(response);
       }else{
         Get.snackbar("Diagnal Solutions Response", "Failed");
       }
  }
}

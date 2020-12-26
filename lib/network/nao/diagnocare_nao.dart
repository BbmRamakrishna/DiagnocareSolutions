import 'package:diagnocare_solutions/network/base/base_api_call.dart';
import 'package:diagnocare_solutions/network/network_endpoints.dart';
import 'package:diagnocare_solutions/network/response/diagnocare_solutions_response.dart';
import 'package:diagnocare_solutions/view/diagnocare_task_controller.dart';
import 'package:flutter/cupertino.dart';

class DiagnocareNao {
  DiagnocareTaskController diagnocareTaskController;

  Future<List<dynamic>> diagnocareRes() async {
    var response = await BaseApi()
        .get(
      // HTTP-GET request
      url: NetworkEndpoints().DIAGNOCARE_SOLUTIONS_API, // REST api URL
    );
    return response;
  }
}

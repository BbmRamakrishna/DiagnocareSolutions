import 'package:getx/network/base/base_api_call.dart';
import 'package:getx/network/network_endpoints.dart';
import 'package:getx/view/getx_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:getx/view/getx_screen_controller.dart';

class GetxScreenNao {
  GetxScreenController getxScreenController;

  Future<List<dynamic>> diagnocareRes() async {
    var response = await BaseApi()
        .get(
      // HTTP-GET request
      url: NetworkEndpoints().getx_API, // REST api URL
    );
    return response;
  }
}

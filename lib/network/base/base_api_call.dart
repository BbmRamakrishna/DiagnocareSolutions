import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diagnocare_solutions/network/utils/NetworkUtils.dart';
import 'package:diagnocare_solutions/utils/api_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class BaseApi {
  // Singleton Instance
  static BaseApi _instance = new BaseApi.internal();

  BaseApi.internal();

  factory BaseApi() => _instance;

  // JsonDecoder object
  final JsonDecoder _decoder = new JsonDecoder();

  //------------------------------------------------------------- Methods -----------------------------------------------------------------------------

  Future<dynamic> get({@required String url, body, encoding, hostname}) {
    showLoader();
    return http
        .get(url,
            headers: NetworkUtils.getApiHeaders(),
    ) // Make HTTP-POST request
        .then((http.Response response) {
      // On response received
      final int statusCode = response.statusCode;
      print("Http Status Code:- ${response.statusCode}");
      print("\nHttp Request Url:- ${response.request}");
      print("\nHTTP Response Body:- ${response.body}");
      print("\nHTTP Request Body:- ${body}");
      dismissLoader();
      // Check response status code for error condition
      if (statusCode < 200 || statusCode > 400 || json == null) {
        // Error occurred
        /* throw new Exception(
            "ErrorCode- $statusCode : Error while fetching data");*/
        Map errorResponse = {"success": false};
        return errorResponse.toString();
      } else {
        // No error occurred
        // Get response body
        final String res = response.body;
        // Convert response body to JSON object
        return _decoder.convert(res) ;
      }
    });
  }


  void showLoader() {
    showDialog(
      context: Get.context,
      builder: (BuildContext context) => ApiLoader(),
    );
  }

  void dismissLoader() {
    Navigator.of(Get.context).pop();
  }
}

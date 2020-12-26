import 'package:diagnocare_solutions/resource/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class ApiLoader extends StatefulWidget {
  @override
  _ApiLoaderState createState() => _ApiLoaderState();
}

class _ApiLoaderState extends State<ApiLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: Loading(indicator: BallPulseIndicator(), size: 100.0, color: AppColors.activeLight),
      ),
    );
  }
}

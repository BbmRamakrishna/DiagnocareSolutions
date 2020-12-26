import 'package:diagnocare_solutions/resource/config/size_config.dart';
import 'package:diagnocare_solutions/resource/values/app_styles.dart';
import 'package:diagnocare_solutions/utils/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DiagnocareSolutionsApp());
}

class DiagnocareSolutionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetBuilder(

      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().initialization(constraints, orientation);
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppStyles.lightTheme(),
                  darkTheme: AppStyles.lightTheme(),
                  themeMode: ThemeMode.system,
                  initialRoute: '/',
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              },
            );
          },
        );
      },
    );
  }
}

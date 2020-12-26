
import 'package:diagnocare_solutions/resource/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';


/// App Styles Class -> Resource class for storing app level styles constants
class AppStyles {

  // Light Theme
  static ThemeData lightTheme(){
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: AppColors.PRIMARY_COLOR,
      highlightColor: AppColors.activeLight,
      primaryColorLight: AppColors.PRIMARY_COLOR_LIGHT,
      primaryColorDark: AppColors.PRIMARY_COLOR_DARK,
      accentColor: AppColors.ACCENT_COLOR,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppDimens.NUM_16.toDouble()),
        hintStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
          color: AppColors.PRIMARY_COLOR,
          fontWeight: FontWeight.bold,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: AppDimens.NUM_12.toDouble(),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          )
        ),
        textTheme:ButtonTextTheme.normal,
        buttonColor: AppColors.ACCENT_COLOR,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme(){
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColor: AppColors.PRIMARY_COLOR,
      primaryColorLight: AppColors.PRIMARY_COLOR_LIGHT,
      primaryColorDark: AppColors.PRIMARY_COLOR_DARK,
      accentColor: AppColors.ACCENT_COLOR,
    );
  }

}
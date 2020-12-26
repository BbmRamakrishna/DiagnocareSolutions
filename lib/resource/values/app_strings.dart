/// App Strings Class -> Resource class for storing app level strings constants
class AppStrings {
  static final AppStrings _instance = AppStrings._internal();

  factory AppStrings() => _instance;

  AppStrings._internal();

  static const String APP_NAME = "Diagnocare Solutions";
  static const String ShowTwoItems = "Show Two Items in List";
  static const String ShowThreeItems = "Show Three Items in List";
  static const String ShowList = "Show List";



}

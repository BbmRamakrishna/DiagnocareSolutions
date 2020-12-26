import 'package:shared_preferences/shared_preferences.dart';


class LocalDataRepository{

  final String navigationOnAppInstall = "Navigation_On_App_Install";

  LocalDataRepository._privateConstructor();

  static final LocalDataRepository instance = LocalDataRepository._privateConstructor();


  Future<String> getnavigationOnAppInstall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.navigationOnAppInstall) ?? "";
  }

  setnavigationOnAppInstall(String navigationOnAppInstall) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.navigationOnAppInstall, navigationOnAppInstall);
  }

}
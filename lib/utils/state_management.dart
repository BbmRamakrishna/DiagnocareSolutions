
/*
Following is the state representation for the app:
  0: First launch is not done.
  1: First launch is complete.
  2: Signup completed.
  3: signup is suspended/ half complete.
  4. Activation completed
  5. Logout State
 */

import 'package:diagnocare_solutions/utils/local_storage.dart';

class StateManagement {
  Future<int> currentState() async {
    return await LocalStorageService.instance.getIntegerValue('appState');
  }

  setFirstLaunchComplete() {
    LocalStorageService.instance.setIntegerValue('appState', 1);
  }

  setOnboardCompleted() {
    LocalStorageService.instance.setIntegerValue('appState', 2);
  }

  setSignUpCompleted() {
    LocalStorageService.instance.setIntegerValue('appState', 3);
  }

  setActivationCompleted() {
    LocalStorageService.instance.setIntegerValue('appState', 4);
  }

  setLogoutCompleted() {
    LocalStorageService.instance.setIntegerValue('appState', 1);
  }
}

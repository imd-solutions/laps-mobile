import '../../../enum/enum.dart';
import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../viewmodels/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  UserApi userApi = locator<UserApi>();

  bool keepLoggedIn = true;
  bool isPassword = true;
  String email = "";
  String password = "";

  void updateEmail(String? value) {
    email = value!;
    // notifyListeners();
  }

  void updateCheckBox(bool? value) {
    keepLoggedIn = value!;
    notifyListeners();
  }

  void updatePassword(String? value) {
    password = value!;
  }

  void showPassword(bool? value) {
    if (value == true) {
      isPassword = false;
    } else {
      isPassword = true;
    }
    notifyListeners();
  }

  Future logUserIn(User user) async {
    setState(ViewStateType.Processing);
    notifyListeners();

    dynamic response = await userApi.loginUser(user, keepLoggedIn);

    setState(ViewStateType.Completed);
    notifyListeners();

    return response;
  }
  //
  // Future setUserProfile() async {
  //   setState(ViewStateType.Processing);
  //   notifyListeners();
  //
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   basicAuth = prefs.getString("userAuth")!;
  //   id = prefs.getString("userID")!;
  //
  //   profile = await userApi.setUserData(basicAuth, id);
  //
  //   setState(ViewStateType.Completed);
  //   notifyListeners();
  //
  //   return profile;
  // }
}

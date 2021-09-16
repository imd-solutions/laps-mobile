import 'package:shared_preferences/shared_preferences.dart';
import '../../enum/enum.dart';
import '../../config/config.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../viewmodels/base_viewmodel.dart';

class IntroViewModel extends BaseViewModel {
  UserApi userService = locator<UserApi>();
  Profile? user;

  void initialise() {
    setState(ViewStateType.Busy);
    _updateUserInfo();
    notifyListeners();
  }

  Future<void> _updateUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? rememberMe = prefs.getBool('rememberMe');
    String? basicAuth = prefs.getString('userAuth');
    String? userID = prefs.getString('userID');

    if (rememberMe == true) {
      user = await userService.getUser(basicAuth!, userID!);
    }

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

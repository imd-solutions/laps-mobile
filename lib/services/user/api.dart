import './../../models/models.dart';

abstract class UserApi {
  Future<dynamic> loginUser(User user, bool stayLoggedIn);

  Future<Profile> setUserData(String basicAuth, String userID);

  Future rememberMe();

  Future getUser(String basicAuth, String userID);

  Future setUserAvatar(String basicAuth);

  Future<void> logoutUser();

  Future forgottenPassword(String email);
}

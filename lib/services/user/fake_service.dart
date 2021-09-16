import 'package:faker/faker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../../services/user/api.dart';
import './../../config/config.dart';
import '../../models/models.dart';

class FakeUserServices implements UserApi {
  @override
  Future loginUser(User user, bool stayLoggedIn) async {
    await Future.delayed(const Duration(seconds: 1));

    var faker = new Faker();

    User testUser = User(
      id: 1,
      name: "${faker.person.name()}",
      avatar: "images/user/user.png",
      email: "${faker.internet.email()}",
    );

    return Message(
      status: 200,
      title: 'Success',
      message: 'Test - Logging you in...',
      colour: Palette.successColour,
      data: testUser,
    );
  }

  @override
  Future rememberMe() async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("rememberMe", true);
  }

  @override
  Future<Profile> setUserData(String basicAuth, String userID) async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("userID", 1);
    prefs.setString("userName", "User Name");
    prefs.setString("userEmail", "email.test@user.com");

    return Profile(
      id: 1,
      firstName: faker.lorem.word(),
      lastName: faker.lorem.word(),
      displayEmail: faker.lorem.word(),
    );
  }

  @override
  Future setUserAvatar(
    String basicAuth,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future getUser(String basicAuth, String userID) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future logoutUser() async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();

    prefs.setBool("rememberMe", false);
    prefs.setInt("userID", 0);
    prefs.setString("userName", "");
    prefs.setString("userEmail", "");
  }

  @override
  Future forgottenPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));

    return Message(
      status: 200,
      title: 'Success',
      message: "Test - That has been processed for you.",
      colour: Palette.successColour,
    );
  }
}

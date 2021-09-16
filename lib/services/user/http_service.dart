import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './../../services/services.dart';
import '../../models/models.dart';
import './../../services/user/api.dart';
import './../../config/config.dart';

class UserService implements UserApi {
  @override
  Future loginUser(User user, bool stayLoggedIn) async {
    try {
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('${user.email}:${user.password}'));
      Map<String, String> headers = {'content-type': 'application/json', 'accept': 'application/json', 'authorization': basicAuth};
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/user/authenticate');
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        //TODO check user is a member or admin

        Map resp = json.decode(response.body);

        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('rememberMe', true);
        prefs.setString("userID", resp["id"]);
        prefs.setString("userAuth", basicAuth);

        this.setUserAvatar(basicAuth);

        return Message(
          status: 200,
          title: 'Success',
          message: 'Logging you in...',
          colour: Palette.successColour,
          data: user,
        );
      } else if (response.statusCode == 401) {
        return Message(
          status: 401,
          title: 'Invalid username or password',
          message: 'Please try again',
          colour: Palette.errorColour,
          data: user,
        );
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return Message(
          status: response.statusCode,
          title: 'An Error Occurred',
          message: 'Please try again later',
          colour: Palette.errorColour,
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Profile> setUserData(String basicAuth, String userID) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': basicAuth,
      };
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/getMember');
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(
          <String, String>{
            'Id': userID,
          },
        ),
      );

      var result = json.decode(response.body);

      return Profile(
        id: result["Id"],
        firstName: result["FirstName"],
        lastName: result["LastName"],
        displayEmail: result["DisplayEmail"],
        image: result["Image"],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future setUserAvatar(String basicAuth) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': basicAuth,
      };
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/user/avatar');
      final response = await http.get(url, headers: headers);

      var result = json.decode(response.body);

      return User(
        avatar: result["url"],
      );
    } catch (e) {}
  }

  @override
  Future getUser(String basicAuth, String userID) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': basicAuth,
      };
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/getMember');
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(
          <String, String>{
            'Id': userID,
          },
        ),
      );

      var result = json.decode(response.body);

      return Profile(
        id: result["Id"],
        firstName: result["FirstName"],
        lastName: result["LastName"],
        displayEmail: result["DisplayEmail"],
        image: result["Image"],
      );
    } catch (e) {}
  }

  @override
  Future rememberMe() async {
    try {} catch (e) {}
  }

  @override
  Future logoutUser() async {
    try {} catch (e) {}
  }

  @override
  Future forgottenPassword(String email) async {
    try {} catch (e) {}
  }
}

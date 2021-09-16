import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class CommunityService implements CommunityApi {
  String post = "community";
  Future<List<Community>> getPosts(String basicAuth) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post');
      Map<String, String> headers = {'content-type': 'application/json', 'accept': 'application/json', 'authorization': basicAuth};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((community) => Community.fromJson(community)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Community> getPost(String basicAuth, int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post/$id');
      Map<String, String> headers = {'content-type': 'application/json', 'accept': 'application/json', 'authorization': basicAuth};
      final response = await http.get(url, headers: headers);

      var result = convert.jsonDecode(response.body);

      return Community(
        id: result["id"],
        title: result["title"],
        image: result["image"] is bool ? "" : result["image"],
        timeAgo: result["timeAgo"],
        // userStatus: result["userStatus"],
        currentUserLikesThread: result["currentUserLikesThread"],
        replies: List<Reply>.from(result["replies"].map((x) => Reply.fromJson(x))),
        likes: result["likes"],
        name: result["name"],
        content: result["content"],
        isAdmin: result["isAdmin"],
        date: result["date"],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Message> addNewThread(String basicAuth, String subject, String content, int catID) async {
    try {
      Map<String, String> headers = {
        'authorization': basicAuth,
      };

      var map = new Map<String, dynamic>();
      map['content'] = content;
      map['subject'] = subject;
      map['category'] = "general";

      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post');
      final response = await http.post(
        url,
        headers: headers,
        body: map,
      );

      var result = convert.jsonDecode(response.body);

      return Message(message: 'That has been processed', title: 'Success', status: 200);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Community> updateThread(String basicAuth, String subject, String content, int threadID) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': basicAuth,
      };
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post');
      final response = await http.post(
        url,
        headers: headers,
        body: convert.jsonEncode(
          <String, dynamic>{
            'subject': subject,
            'content': content,
            'thread_id': threadID,
          },
        ),
      );

      var result = convert.jsonDecode(response.body);

      return Community(
        id: result["id"],
        title: result["title"],
        timeAgo: result["timeAgo"],
        isAdmin: result["isAdmin"],
        currentUserLikesThread: result["currentUserLikesThread"],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Message> replyToThread(String basicAuth, String subject, String content, int parentID) async {
    try {
      Map<String, String> headers = {
        'authorization': basicAuth,
      };

      var map = new Map<String, dynamic>();
      map['content'] = content;
      map['subject'] = subject;
      map['parent'] = parentID.toString();

      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post');
      final response = await http.post(
        url,
        headers: headers,
        body: map,
      );

      var result = convert.jsonDecode(response.body);

      return Message(message: 'That has been processed', title: 'Success', status: 200);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Message> likeAThread(String basicAuth, int id, int like) async {
    try {
      Map<String, String> headers = {
        'authorization': basicAuth,
      };

      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post/$id/like/$like');
      final response = await http.post(
        url,
        headers: headers,
      );

      var result = convert.jsonDecode(response.body);

      print(result);

      return Message(message: 'That has been processed', title: 'Success', status: 200);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Message> followAThread(String basicAuth, int id, int follow) async {
    try {
      Map<String, String> headers = {
        'authorization': basicAuth,
      };

      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post/$id/follow/$follow');
      final response = await http.post(
        url,
        headers: headers,
      );

      var result = convert.jsonDecode(response.body);

      print(result);

      return Message(message: 'That has been processed', title: 'Success', status: 200);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Follow>> getFollowing(String basicAuth) async {
    try {
      Map<String, String> headers = {
        'authorization': basicAuth,
      };

      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/$post/following');
      final response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((follow) => Follow.fromJson(follow)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }

    } catch (e) {
      throw Exception(e);
    }
  }


}

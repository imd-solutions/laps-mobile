import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class FeedService implements FeedApi {
  @override
  Future<List<Feed>> getFeed(String basicAuth) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/feed');
      Map<String, String> headers = {'content-type': 'application/json', 'accept': 'application/json', 'authorization': basicAuth};
      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((feed) => Feed.fromJson(feed)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

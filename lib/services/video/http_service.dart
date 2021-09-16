import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class VideoService implements VideoApi {
  String post = "videos";
  @override
  Future<List<Video>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((videos) => Video.fromJson(videos)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Video> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      return Video(
          id: result["id"],
          date: DateTime.parse(result["date"]),
          slug: result["slug"],
          title: WPGuid(rendered: result["title"]["rendered"]),
          acf: AcfOverview(
            embedLink: result["acf"]["embed_link"],
            overview: result["acf"]["overview"],
          ),
          laps: LapsYoutube(
            youtubeImage: result["laps"]["youtube_image"],
          ));
    } catch (e) {
      throw Exception(e);
    }
  }
}

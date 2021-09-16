import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class PostService implements PostApi {
  String post = "posts";
  @override
  Future<List<Post>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((posts) => Post.fromJson(posts)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Post> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      return Post(
        id: result["id"],
        date: DateTime.parse(result["date"]),
        guid: WPGuid(rendered: result["guid"]["rendered"]),
        slug: result["slug"],
        link: result["link"],
        title: WPGuid(rendered: result["title"]["rendered"]),
        content: WPContent(rendered: result["content"]["rendered"]),
        excerpt: WPContent(rendered: result["excerpt"]["rendered"]),
        acf: Acf(
          bannerImage: BannerImage(id: result["acf"]["banner_image"]["id"], url: result["acf"]["banner_image"]["url"]),
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

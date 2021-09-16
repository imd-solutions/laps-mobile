import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class FranchiseService implements FranchiseApi {
  String post = "franchises";
  @override
  Future<List<Franchise>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((franchise) => Franchise.fromJson(franchise)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Franchise> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      return Franchise(
        id: result["id"],
        date: DateTime.parse(result["date"]),
        slug: result["date"],
        title: WPGuid(rendered: result["title"]["rendered"]),
        acf: AcfFranchise(
            logo: FeaturedImage(id: result["acf"]["logo"]["id"], title: result["acf"]["logo"]["title"], url: result["acf"]["logo"]["url"]),
            // headerImage: FeaturedImage(id: result["acf"]["header_image"]["id"], title: result["acf"]["header_image"]["title"], url: result["acf"]["header_image"]["url"]),
            headline: result["acf"]["headline"],
            content: result["acf"]["content"],
            bottomYoutubeLink: result["acf"]["bottom_youtube_link"]),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

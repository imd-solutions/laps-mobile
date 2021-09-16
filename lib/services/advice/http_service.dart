import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class AdviceService implements AdviceApi {
  String post = "advice";
  @override
  Future<List<Advice>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((advice) => Advice.fromJson(advice)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Advice> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      return Advice(
        id: result["id"],
        date: DateTime.parse(result["date"]),
        slug: result["date"],
        title: WPGuid(rendered: result["title"]["rendered"]),
        content: WPContent(rendered: result["content"]["rendered"]),
        acf: result['acf']['featured_image'] != false
            ? AcfFeatured(
                featuredImage: FeaturedImage(
                  id: result['acf']['featured_image']['id'],
                  title: result['acf']['featured_image']['title'],
                  url: result['acf']['featured_image']['url'],
                ),
              )
            : null,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

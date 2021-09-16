import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class CareerService implements CareerApi {
  String post = "sectors";
  @override
  Future<List<Career>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((careers) => Career.fromJson(careers)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Career> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      print('This is the results for career: $result');

      return Career(
        id: result["id"],
        date: DateTime.parse(result["date"]),
        slug: result["slug"],
        title: WPGuid(rendered: result["title"]["rendered"]),
        acf: AcfFeatured(
          featuredImage: FeaturedImage(id: result['acf']['featured_image']['id'], title: result['acf']['featured_image']['title'], url: result['acf']['featured_image']['url']),
          generalOverview: result['acf']['general_overview'],
        ),
        laps: Laps(sectorId: result['laps']['sector_id']),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<WPIdName>> getRoles(int id) async {

    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/content/getroles');
      final response = await http.post(url, body: {
        'SectorId': id.toString(),
      });
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((wpidname) => WPIdName.fromJson(wpidname)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

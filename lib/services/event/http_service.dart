import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class EventService implements EventApi {
  String post = "events";
  @override
  Future<List<Event>> getPosts() async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((events) => Event.fromJson(events)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Event> getPost(int id) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/wp/v2/$post/$id');
      final response = await http.get(url);

      var result = convert.jsonDecode(response.body);

      return Event(
        id: result["id"],
        date: DateTime.parse(result["date"]),
        slug: result["slug"],
        title: WPGuid(rendered: result["title"]["rendered"]),
        content: WPContent(rendered: result["content"]["rendered"]),
        acf: AcfListImage(
          listImage: FeaturedImage(id: result['acf']['list_image']['id'], title: result['acf']['list_image']['title'], url: result['acf']['list_image']['url']),
          featuredImage: FeaturedImage(id: result['acf']['featured_image']['id'], title: result['acf']['featured_image']['title'], url: result['acf']['featured_image']['url']),
          address: result["acf"]["address"],
          eventDate: result["acf"]["event_date"],
          startTime: result["acf"]["start_time"],
          endTime: result["acf"]["end_time"],
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import './../../services/services.dart';

class ContactFormService implements ContactFormApi {
  @override
  Future postForm(int formId, data) async {
    try {
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/contact-form-7/v1/contact-forms/$formId/feedback');
      final response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

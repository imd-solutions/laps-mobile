import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import './../../services/services.dart';
import '../../models/models.dart';

class JobService implements JobApi {
  @override
  Future<List<Vacancy>> searchForOpportunities(String basicAuth, String userID, int salary, double lat, double long, int miles, List<String> empType, List<String> workHours, String keywords) async {
    try {
      Map<String, String> headers = {'content-type': 'application/json', 'accept': 'application/json', 'authorization': basicAuth};
      var url = Uri.parse('https://laps-app.phase4web.com/wp-json/laps/v1/members/getJobList');
      final response = await http.post(url,
          headers: headers,
          body: convert.jsonEncode(
            <String, dynamic>{
              'AuthMemberId': userID,
              'MinSalary': salary,
              'SearchOriginLatitude': lat,
              'SearchOriginLongitude': long,
              'SearchRadiusMiles': miles,
              'EmploymentType': empType,
              'WorkingHours': workHours,
              'Keywords': keywords,
            },
          ));
      if (response.statusCode == 200) {
        final result = convert.jsonDecode(response.body);

        Iterable list = result;

        return list.map((jobs) => Vacancy.fromJson(jobs)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

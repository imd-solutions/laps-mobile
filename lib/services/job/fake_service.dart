import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeJobServices implements JobApi {
  var faker = new Faker();

  @override
  Future<List<Vacancy>> searchForOpportunities(String basicAuth, String userID, int salary, double lat, double long, int miles, List<String> empType, List<String> workHours, String keywords) async {
    // TODO: implement searchForOpportunities
    return List<Vacancy>.generate(
      5,
      (index) => Vacancy(
        id: index + 1,
        employmentType: [],
        jobTitle: '',
        workingHours: [],
        jobSummary: '',
        clientId: 1,
      ),
    );
  }
}

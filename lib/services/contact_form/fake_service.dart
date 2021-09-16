import 'package:faker/faker.dart';
import '../../services/services.dart';

class FakeContactFormServices implements ContactFormApi {
  var faker = new Faker();
  @override
  Future postForm(int formId, data) {
    // TODO: implement postForm
    throw UnimplementedError();
  }
}
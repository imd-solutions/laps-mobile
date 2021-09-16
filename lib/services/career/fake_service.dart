import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeCareerServices implements CareerApi {
  var faker = new Faker();
  String post = "post";

  @override
  Future<List<Career>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Career>.generate(
      5,
      (index) => Career(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        acf: AcfFeatured(
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          generalOverview: faker.lorem.sentence(),
        ),
        laps: Laps(sectorId: "1"),
      ),
    );
  }

  @override
  Future<List<WPIdName>> getRoles(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return List<WPIdName>.generate(
      5,
      (index) => WPIdName(
        id: index,
        name: faker.lorem.word(),
        slug: faker.lorem.word(),
      ),
    );
  }

  @override
  Future<Career> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Career(
      id: id,
      date: DateTime.parse("2021-02-22T10:54:21"),
      slug: faker.lorem.word(),
      title: WPGuid(rendered: faker.lorem.word()),
      acf: AcfFeatured(
        featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
        generalOverview: faker.lorem.sentence(),
      ),
      laps: Laps(sectorId: "1"),
    );
  }
}

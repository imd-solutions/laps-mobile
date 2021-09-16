import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeEventServices implements EventApi {
  var faker = new Faker();
  String post = "events";
  @override
  Future<List<Event>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Event>.generate(
      5,
      (index) => Event(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        content: WPContent(rendered: faker.lorem.sentence()),
        acf: AcfListImage(
          listImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
        ),
      ),
    );
  }

  @override
  Future<Event> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Event(
      id: id,
      date: DateTime.parse("2021-02-22T10:54:21"),
      slug: faker.lorem.word(),
      title: WPGuid(rendered: faker.lorem.word()),
      content: WPContent(rendered: faker.lorem.sentence()),
      acf: AcfListImage(
        listImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
        featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
      ),
    );
  }
}

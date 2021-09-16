import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeAdviceServices implements AdviceApi {
  var faker = new Faker();
  String post = "advice";
  @override
  Future<List<Advice>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Advice>.generate(
      5,
      (index) => Advice(
        id: index + 1,
        date: DateTime.parse(faker.date.toString()),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        content: WPContent(rendered: faker.lorem.sentence()),
        acf: AcfFeatured(
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
        ),
      ),
    );
  }

  @override
  Future<Advice> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Advice(
        id: id,
        date: DateTime.parse(faker.date.toString()),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        content: WPContent(rendered: faker.lorem.sentence()),
        acf: AcfFeatured(
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
        ),
    );
  }
}

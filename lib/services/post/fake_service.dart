import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakePostServices implements PostApi {
  var faker = new Faker();
  String post = "post";
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Post>.generate(
      5,
      (index) => Post(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        guid: WPGuid(rendered: faker.lorem.word()),
        slug: faker.lorem.word(),
        link: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.sentence()),
        content: WPContent(rendered: faker.lorem.sentence()),
        excerpt: WPContent(rendered: faker.lorem.sentence()),
        acf: Acf(
          bannerImage: BannerImage(id: 1, url: faker.lorem.sentence()),
        ),
      ),
    );
  }

  @override
  Future<Post> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Post(
        id: id,
        date: DateTime.parse("2021-02-22T10:54:21"),
        guid: WPGuid(rendered: faker.lorem.word()),
        slug: faker.lorem.word(),
        link: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.sentence()),
        content: WPContent(rendered: faker.lorem.sentence()),
        excerpt: WPContent(rendered: faker.lorem.sentence()),
        acf: Acf(
          bannerImage: BannerImage(id: 1, url: faker.lorem.sentence()),
        ));
  }
}

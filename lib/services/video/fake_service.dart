import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeVideoServices implements VideoApi {
  var faker = new Faker();
  String post = "post";
  @override
  Future<List<Video>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Video>.generate(
      5,
      (index) => Video(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        acf: AcfOverview(
          embedLink: faker.lorem.word(),
          overview: faker.lorem.word(),
        ),
        laps: LapsYoutube(
          youtubeImage: faker.lorem.word()
        )
      ),
    );
  }

  @override
  Future<Video> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Video(
      id: id,
      date: DateTime.parse("2021-02-22T10:54:21"),
      slug: faker.lorem.word(),
      title: WPGuid(rendered: faker.lorem.word()),
      acf: AcfOverview(
        embedLink: faker.lorem.word(),
        overview: faker.lorem.word(),
      ),
      laps: LapsYoutube(
        youtubeImage: faker.lorem.word()
      )
    );
  }
}

import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeFranchiseServices implements FranchiseApi {
  var faker = new Faker();
  String post = "post";
  @override
  Future<List<Franchise>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Franchise>.generate(
      5,
          (index) => Franchise(
            id: index + 1,
            date: DateTime.parse("2021-02-22T10:54:21"),
            slug: faker.lorem.word(),
            title: WPGuid(rendered: faker.lorem.word()),
            acf: AcfFranchise(
                logo: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
                // headerImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
                headline: faker.lorem.sentence(),
                content: faker.lorem.sentence(),
                bottomYoutubeLink: faker.lorem.sentence()
            ),
          ),
    );
  }

  @override
  Future<Franchise> getPost(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Franchise(
      id: id,
      date: DateTime.parse("2021-02-22T10:54:21"),
      slug: faker.lorem.word(),
      title: WPGuid(rendered: faker.lorem.word()),
      acf: AcfFranchise(
          logo: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          // headerImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          headline: faker.lorem.sentence(),
          content: faker.lorem.sentence(),
          bottomYoutubeLink: faker.lorem.sentence()
      ),
    );
  }
}

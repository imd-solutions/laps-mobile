import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeRoleServices implements RoleApi {
  var faker = new Faker();
  String post = "post";

  @override
  Future<List<Role>> getPosts() async {
    await Future.delayed(Duration(seconds: 1));
    return List<Role>.generate(
      5,
      (index) => Role(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        acf: AcfFeaturedRole(
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          generalOverview: faker.lorem.sentence(),
          qualificationsNeeded: faker.lorem.word(),
          suitability: faker.lorem.word(),
          payRange: faker.lorem.word(),
          tips: [],
          supportLinks: [],
          similarRoles: [],
          courseLinks: [],
        ),
      ),
    );
  }

  @override
  Future<List<Role>> getPost(String slug) async {
    await Future.delayed(Duration(seconds: 1));
    return List<Role>.generate(
      5,
      (index) => Role(
        id: index + 1,
        date: DateTime.parse("2021-02-22T10:54:21"),
        slug: faker.lorem.word(),
        title: WPGuid(rendered: faker.lorem.word()),
        acf: AcfFeaturedRole(
          featuredImage: FeaturedImage(id: faker.randomGenerator.integer(1), title: faker.lorem.word(), url: faker.lorem.word()),
          generalOverview: faker.lorem.sentence(),
          qualificationsNeeded: faker.lorem.word(),
          suitability: faker.lorem.word(),
          payRange: faker.lorem.word(),
          tips: [],
          supportLinks: [],
          similarRoles: [],
          courseLinks: [],
        ),
      ),
    );
  }
}

import 'package:faker/faker.dart';
import '../../models/models.dart';
import '../../services/services.dart';

class FakeCommunityServices implements CommunityApi {
  Future<List<Community>> getPosts(String basicAut) async {
    await Future.delayed(Duration(seconds: 1));
    return List<Community>.generate(
      5,
      (index) => Community(
        id: index + 1,
        title: Faker().lorem.word(),
        // image: false,
        timeAgo: Faker().lorem.word(),
        currentUserLikesThread: false,
        reply: Faker().lorem.random.integer(20),
        likes: Faker().lorem.random.integer(20),
        isAdmin: false,
      ),
    );
  }

  Future<Community> getPost(String basicAuth, int id) async {
    await Future.delayed(Duration(seconds: 1));
    return Community(
      id: 1,
      title: Faker().lorem.word(),
      // image: false,
      timeAgo: Faker().lorem.word(),
      // userStatus: Faker().lorem.word(),
      currentUserLikesThread: false,
      replies: List<Reply>.generate(
        5,
        (index) => Reply(
          id: index + 1,
          title: Faker().lorem.word(),
          name: Faker().person.firstName(),
          content: Faker().lorem.sentence(),
          date: Faker().lorem.word(),
          // image: Faker().lorem.word(),
          timeAgo: Faker().lorem.word(),
          currentUserLikesThread: false,
          replies: Faker().lorem.random.integer(20),
          likes: Faker().lorem.random.integer(20),
          isAdmin: false,
          // userStatus: Faker().person.firstName(),
        ),
      ),
      likes: 1,
      name: Faker().lorem.word(),
      content: Faker().lorem.word(),
      isAdmin: false,
      date: Faker().lorem.word(),
    );
  }

  Future<Message> addNewThread(String basicAuth, String subject, String content, int catID) async {
    throw UnimplementedError();
  }

  Future<Community> updateThread(String basicAuth, String subject, String content, int threadID) async {
    throw UnimplementedError();
  }

  Future<Message> replyToThread(String basicAuth, String subject, String content, int parentID) async {
    throw UnimplementedError();
  }

  Future<Message> likeAThread(String basicAuth, int id, int like) async {
    throw UnimplementedError();
  }

  Future<Message> followAThread(String basicAuth, int id, int follow) async {
    throw UnimplementedError();
  }

  Future<List<Follow>> getFollowing(String basicAuth) async {
    throw UnimplementedError();
  }
}

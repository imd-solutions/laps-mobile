import './../../models/models.dart';

abstract class CommunityApi {
  Future<List<Community>> getPosts(String basicAuth);

  Future<Community> getPost(String basicAuth, int id);

  Future<Message> addNewThread(String basicAuth, String subject, String content, int catID);

  Future<Community> updateThread(String basicAuth, String subject, String content, int threadID);

  Future<Message> replyToThread(String basicAuth, String subject, String content, int parentID);

  Future<Message> likeAThread(String basicAuth, int id, int like);

  Future<Message> followAThread(String basicAuth, int id, int follow);

  Future<List<Follow>> getFollowing(String basicAuth);
}

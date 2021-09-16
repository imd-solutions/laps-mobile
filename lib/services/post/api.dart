import './../../models/models.dart';

abstract class PostApi {

  Future<List<Post>> getPosts();

  Future<Post> getPost(int id);

}
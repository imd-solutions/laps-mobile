import './../../models/models.dart';

abstract class VideoApi {

  Future<List<Video>> getPosts();

  Future<Video> getPost(int id);

}
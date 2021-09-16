import './../../models/models.dart';

abstract class CareerApi {

  Future<List<Career>> getPosts();

  Future<List<WPIdName>> getRoles(int id);

  Future<Career> getPost(int id);

}
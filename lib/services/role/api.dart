import './../../models/models.dart';

abstract class RoleApi {

  Future<List<Role>> getPosts();

  Future<List<Role>>  getPost(String slug);

}
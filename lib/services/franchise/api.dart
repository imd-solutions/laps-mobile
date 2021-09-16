import './../../models/models.dart';

abstract class FranchiseApi {

  Future<List<Franchise>> getPosts();

  Future<Franchise> getPost(int id);

}
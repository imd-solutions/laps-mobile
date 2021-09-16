import './../../models/models.dart';

abstract class AdviceApi {

  Future<List<Advice>> getPosts();

  Future<Advice> getPost(int id);

}
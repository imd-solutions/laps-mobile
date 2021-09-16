import './../../models/models.dart';

abstract class EventApi {

  Future<List<Event>> getPosts();

  Future<Event> getPost(int id);

}
import './../../models/models.dart';

abstract class FeedApi {

  Future<List<Feed>> getFeed(String basicAuth);

}
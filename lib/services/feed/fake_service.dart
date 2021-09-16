import 'package:laps/services/feed/api.dart';
import './../../models/models.dart';

class FakeFeedServices implements FeedApi {
  @override
  Future<List<Feed>>  getFeed(String basicAuth) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

}
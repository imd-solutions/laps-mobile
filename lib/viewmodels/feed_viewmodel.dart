import 'package:shared_preferences/shared_preferences.dart';
import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class FeedViewModel extends BaseViewModel {
  FeedApi feedApi = locator<FeedApi>();
  String? basicAuth;

  late List<Feed> feed;

  void initialise() {
    feed = [];
    setState(ViewStateType.Busy);
    getFeedFromAPI();
    notifyListeners();
  }

  Future<List<Feed>> getFeedFromAPI() async {
    final prefs = await SharedPreferences.getInstance();

    basicAuth = prefs.getString("userAuth");

    feed = await feedApi.getFeed(basicAuth!);

    setState(ViewStateType.Completed);
    notifyListeners();

    return feed;
  }
}

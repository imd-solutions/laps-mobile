import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class EventViewModel extends BaseViewModel {
  EventApi eventApi = locator<EventApi>();

  late Event post;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getSinglePostFromAPI(postData);
    notifyListeners();
  }

  Future getSinglePostFromAPI(postData) async {
    post = await eventApi.getPost(postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

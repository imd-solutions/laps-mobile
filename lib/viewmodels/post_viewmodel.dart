import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class PostViewModel extends BaseViewModel {
  PostApi postApi = locator<PostApi>();

  late Post post;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getSinglePostFromAPI(postData);
    notifyListeners();
  }

  Future getSinglePostFromAPI(postData) async {
    post = await postApi.getPost(postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

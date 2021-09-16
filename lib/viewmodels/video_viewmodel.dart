import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class VideoViewModel extends BaseViewModel {
  VideoApi postApi = locator<VideoApi>();

  late Video post;
  late String postImg;

  void initialise(postData) {
    postImg = "";
    setState(ViewStateType.Busy);
    getSingleVideoFromAPI(postData);
    notifyListeners();
  }

  Future getSingleVideoFromAPI(postData) async {
    postImg = await postData["data"];
    post = await postApi.getPost(postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class AdviceViewModel extends BaseViewModel {
  AdviceApi adviceApi = locator<AdviceApi>();

  late Advice advice;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getSingleAdviceFromAPI(postData);
    notifyListeners();
  }

  Future getSingleAdviceFromAPI(postData) async {
    advice = await adviceApi.getPost(postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class CareerViewModel extends BaseViewModel {
  CareerApi eventApi = locator<CareerApi>();

  late List<WPIdName> posts;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getRolesFrormSectorId(postData);
    notifyListeners();
  }

  Future getRolesFrormSectorId(postData) async {
    posts = await eventApi.getRoles(postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }
}

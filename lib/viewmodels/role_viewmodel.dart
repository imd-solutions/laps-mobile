import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class RoleViewModel extends BaseViewModel {
  RoleApi roleApi = locator<RoleApi>();

  bool showMoreGeneral = true;
  String generalString = "Show More";
  bool showMoreSuitability = true;
  String suitabilityString = "Show More";
  bool showMoreQualification = true;
  String qualificationString = "Show More";
  bool showMorePayRange = true;
  String payRangeString = "Show More";

  late List<Role> post;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getSinglePostFromAPI(postData);
    notifyListeners();
  }

  Future getSinglePostFromAPI(postData) async {
    post = await roleApi.getPost(postData["slug"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  void updateGeneral() {
    if (showMoreGeneral == true) {
      showMoreGeneral = false;
      generalString = "Show Less";
    } else {
      showMoreGeneral = true;
      generalString = "Show More";
    }
    notifyListeners();
  }

  void updateSuitability() {
    if (showMoreSuitability == true) {
      showMoreSuitability = false;
      suitabilityString = "Show Less";
    } else {
      showMoreSuitability = true;
      suitabilityString = "Show More";
    }
    notifyListeners();
  }

  void updateQualification() {
    if (showMoreQualification == true) {
      showMoreQualification = false;
      qualificationString = "Show Less";
    } else {
      showMoreQualification = true;
      qualificationString = "Show More";
    }
    notifyListeners();
  }

  void updatePayRange() {
    if (showMorePayRange == true) {
      showMorePayRange = false;
      payRangeString = "Show Less";
    } else {
      showMorePayRange = true;
      payRangeString = "Show More";
    }
    notifyListeners();
  }
}

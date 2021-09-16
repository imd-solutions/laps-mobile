import 'package:shared_preferences/shared_preferences.dart';
import '../../enum/enum.dart';
import '../../config/config.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../viewmodels/viewmodels.dart';

class JobViewModel extends BaseViewModel {
  UserApi userService = locator<UserApi>();
  JobApi jobService = locator<JobApi>();
  Profile? user;

  late List<TitleViewModel> within = <TitleViewModel>[];
  late List<TitleViewModel> salary = <TitleViewModel>[];

  List<WpData> _within = [
    WpData(id: "1", name: "5 miles", data: "5"),
    WpData(id: "2", name: "10 miles", data: "10"),
    WpData(id: "3", name: "15 miles", data: "15"),
    WpData(id: "4", name: "30 miles", data: "30"),
    WpData(id: "5", name: "50 miles", data: "50"),
    WpData(id: "6", name: "75 miles", data: "75"),
    WpData(id: "7", name: "100 miles", data: "100"),
  ];
  List<WpData> _salary = [
    WpData(id: "1", name: "Any", data: ""),
    WpData(id: "2", name: "£20K or above", data: "20"),
    WpData(id: "3", name: "£30K or above", data: "30"),
    WpData(id: "4", name: "£40K or above", data: "40"),
    WpData(id: "5", name: "£50K or above", data: "50"),
    WpData(id: "6", name: "£60K or above", data: "60"),
  ];

  String keywords = "";
  int withinDropdown = 0;
  int salaryDropdown = 0;

  bool permanent = false;
  bool temporary = false;
  bool contract = false;
  bool placement = false;
  bool fullTime = false;
  bool partTime = false;

  String withinInfo = "";
  String salaryInfo = "";
  List<String> empType = [];
  List<String> workHours = [];

  late List<Vacancy> vacancies;

  void initialise() {
    vacancies = [];
    setState(ViewStateType.Busy);
    updateDropdownMenus();
    notifyListeners();
  }

  Future updateDropdownMenus() async {
    within = await _within.map((within) => TitleViewModel(title: within)).toList();
    salary = await _salary.map((salary) => TitleViewModel(title: salary)).toList();

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future<List<Vacancy>> searchForOpportunity() async {
    setState(ViewStateType.Processing);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String basicAuth = prefs.getString("userAuth")!;
    String userID = prefs.getString("userID")!;
    double lat = 51.9275;
    double long = 0.6524;

    vacancies = await jobService.searchForOpportunities(basicAuth, userID, int.parse(salaryInfo), lat, long, int.parse(withinInfo), empType, workHours, keywords);

    setState(ViewStateType.Completed);
    notifyListeners();

    return vacancies;
  }

  void updateKeywords(val) {
    keywords = val;
    notifyListeners();
  }

  void updateSalaryNumber(val) {
    // print(val);
    salaryDropdown = val;
    int i = val - 1;
    salaryInfo = _salary[i].data!;
    notifyListeners();
  }

  void updateWithinNumber(val) {
    withinDropdown = val;
    int i = val - 1;
    withinInfo = _within[i].data!;
    notifyListeners();
  }

  void updateCheckboxData(String checkbox, bool? value) {
    switch (checkbox) {
      case 'permanent':
        {
          if (value == true) {
            empType.add("P");
          } else {
            empType.remove("P");
          }
          permanent = value!;
        }
        break;
      case 'temporary':
        {
          if (value == true) {
            empType.add("T");
          } else {
            empType.remove("T");
          }
          temporary = value!;
        }
        break;
      case 'contract':
        {
          if (value == true) {
            empType.add("C");
          } else {
            empType.remove("C");
          }
          contract = value!;
        }
        break;
      case 'placement':
        {
          if (value == true) {
            empType.add("U");
          } else {
            empType.remove("U");
          }
          placement = value!;
        }
        break;
      case 'fullTime':
        {
          if (value == true) {
            workHours.add("F");
          } else {
            workHours.remove("F");
          }
          fullTime = value!;
        }
        break;
      case 'partTime':
        {
          if (value == true) {
            workHours.add("P");
          } else {
            workHours.remove("P");
          }
          partTime = value!;
        }
        break;
      default:
        {}
        break;
    }
    notifyListeners();
  }

  void resetVacancySearch() {
    vacancies = [];
    notifyListeners();
  }
}

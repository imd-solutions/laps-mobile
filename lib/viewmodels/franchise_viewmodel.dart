import 'package:shared_preferences/shared_preferences.dart';
import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class FranchiseViewModel extends BaseViewModel {
  UserApi userApi = locator<UserApi>();
  FranchiseApi postApi = locator<FranchiseApi>();
  ContactFormApi contactFormApi = locator<ContactFormApi>();

  late List<TitleViewModel> titles = <TitleViewModel>[];
  late List<TitleViewModel> employment = <TitleViewModel>[];
  late List<TitleViewModel> startup = <TitleViewModel>[];
  late List<TitleViewModel> funding = <TitleViewModel>[];

  List<WpData> _employments = [
    WpData(id: "1", name: "Full-Time Employed"),
    WpData(id: "2", name: "Part-Time Employed"),
    WpData(id: "3", name: "Self Employed"),
    WpData(id: "4", name: "Unemployed"),
    WpData(id: "5", name: "Becoming Redundant"),
    WpData(id: "6", name: "Other"),
  ];
  List<WpData> _startups = [
    WpData(id: "1", name: "As soon as possible"),
    WpData(id: "2", name: "1 - 3 months"),
    WpData(id: "3", name: "3 - 6 months"),
    WpData(id: "4", name: "6 - 12 months"),
    WpData(id: "5", name: "12 months plus"),
  ];
  List<WpData> _fundings = [
    WpData(id: "1", name: "Prefer not to say"),
    WpData(id: "2", name: "£10,001 - £25,000"),
    WpData(id: "3", name: "£25,001 - £50,000"),
    WpData(id: "4", name: "£50,001 - £100,000"),
    WpData(id: "5", name: "£100,001 - £250,000"),
    WpData(id: "6", name: "Over £250,000"),
  ];

  int employmentDropdown = 0;
  int fundingDropdown = 0;
  int startupDropdown = 0;
  String telephone = "";

  String employmentInfo = "";
  String startupInfo = "";
  String fundingInfo = "";

  late String comments = "";

  late Franchise post;

  void initialise(postData) {
    setState(ViewStateType.Busy);
    getSinglePostFromAPI(postData);
    notifyListeners();
  }

  Future getSinglePostFromAPI(postData) async {
    post = await postApi.getPost(postData["id"]);

    List<WpData> _locations = await [WpData(id: "1", name: "Mr")];

    titles = await _locations.map((location) => TitleViewModel(title: location)).toList();
    employment = await _employments.map((employment) => TitleViewModel(title: employment)).toList();
    startup = await _startups.map((startup) => TitleViewModel(title: startup)).toList();
    funding = await _fundings.map((funding) => TitleViewModel(title: funding)).toList();

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future postDataToContactForm(int postId) async {
    setState(ViewStateType.Processing);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String basicAuth = prefs.getString("userAuth")!;
    String userID = prefs.getString("userID")!;

    Profile profile = await userApi.getUser(basicAuth, userID);

    int formId = 1330;
    final data = {
      'your-name': '${profile.firstName} ${profile.lastName}',
      'email': '${profile.displayEmail}',
      'franchise': '$postId',
      'user-id': '${profile.id}',
      'user-name': '${profile.firstName} ${profile.lastName}',
      'tel': telephone,
      'status': employmentInfo,
      'timeframe': startupInfo,
      'funding': fundingInfo,
      'question': comments,
    };

    final response = await contactFormApi.postForm(formId, data);

    setState(ViewStateType.Completed);
    notifyListeners();

    return response;
  }

  void updateTelephoneNumber(val) {
    telephone = val;
    notifyListeners();
  }

  void updateEmploymentNumber(val) {
    employmentDropdown = val;
    int i = val - 1;
    employmentInfo = _employments[i].name;
    notifyListeners();
  }

  void updateStartupNumber(val) {
    startupDropdown = val;
    int i = val - 1;
    startupInfo = _startups[i].name;
    notifyListeners();
  }

  void updateFundingNumber(val) {
    fundingDropdown = val;
    int i = val - 1;
    fundingInfo = _fundings[i].name;
    notifyListeners();
  }

  void updateCommentsQuestions(String val) {
    comments = val;
  }
}

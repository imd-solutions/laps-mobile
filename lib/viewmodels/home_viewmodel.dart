import 'package:laps/models/franchise_model.dart';
import 'package:laps/models/video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../enum/enum.dart';
import '../../config/config.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../../viewmodels/viewmodels.dart';

class HomeViewModel extends BaseViewModel {
  UserApi userApi = locator<UserApi>();
  ApplicationApi applicationApi = locator<ApplicationApi>();
  FeedApi feedApi = locator<FeedApi>();
  PostApi postApi = locator<PostApi>();
  AdviceApi adviceApi = locator<AdviceApi>();
  EventApi eventApi = locator<EventApi>();
  CareerApi careerApi = locator<CareerApi>();
  FranchiseApi franchiseApi = locator<FranchiseApi>();
  VideoApi videoApi = locator<VideoApi>();
  CommunityApi communityApi = locator<CommunityApi>();

  LoginViewModel loginViewModel = locator<LoginViewModel>();

  int bottomNavIndex = 0;
  int forumId = 0;
  String communityThreadSubject = "";
  String communityThreadContent = "";
  late String userId;
  late String userEmail;
  late String basicAuth = "";
  late String id = "";

  late User user;
  late Profile profile;

  late Application application;
  late List<Feed> feed = [];
  late List<Follow> following = [];
  late List<Post> posts = [];
  late List<Advice> advices = [];
  late List<Career> careers = [];
  late List<Event> events = [];
  late List<Franchise> franchises = [];
  late List<Video> videos = [];
  late String section = "";
  late List<Community> communities = [];

  void initialise() {
    application = Application(name: "", environment: "", version: "", year: "");
    userId = "";
    userEmail = "";
    user = User();
    profile = Profile(id: 1, firstName: "", lastName: "", displayEmail: "", image: "");
    setState(ViewStateType.Busy);
    _applicationInfo();
    setUserProfile();
    getPostFromAPI();
    notifyListeners();
  }

  Future<void> _applicationInfo() async {
    application = await applicationApi.getApplication();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userID')!;
    userEmail = prefs.getString('userEmail')!;
    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future setUserProfile() async {
    final prefs = await SharedPreferences.getInstance();

    basicAuth = prefs.getString("userAuth")!;
    id = prefs.getString("userID")!;

    user = await userApi.setUserAvatar(basicAuth);
    profile = await userApi.setUserData(basicAuth, id);

    setState(ViewStateType.Completed);
    notifyListeners();

    return profile;
  }

  Future<void> logUserOut() async {
    setState(ViewStateType.Busy);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', '');
    prefs.setString('userEmail', '');
    prefs.setBool('rememberMe', false);

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future getPostFromAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? basicAuth = prefs.getString('userAuth');
    feed = await feedApi.getFeed(basicAuth!);
    posts = await postApi.getPosts();
    advices = await adviceApi.getPosts();
    events = await eventApi.getPosts();
    events = await eventApi.getPosts();
    careers = await careerApi.getPosts();
    communities = await communityApi.getPosts(basicAuth);
    franchises = await franchiseApi.getPosts();
    videos = await videoApi.getPosts();
    following = await communityApi.getFollowing(basicAuth);

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  void updateBottomNavIndex(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

  void updateSection(String sectionInfo) {
    section = '${sectionInfo[0].toUpperCase()}${sectionInfo.substring(1)}';
    notifyListeners();
  }

  void updatePostId(String post, int id) {
    switch (post) {
      case 'forum':
        {
          forumId = id;
        }
        break;
      default:
        {}
        break;
    }

    notifyListeners();
  }

  void updateCommunityThreadSubject(String value) {
    communityThreadSubject = value;
  }

  void updateCommunityThreadContent(String value) {
    communityThreadContent = value;
  }

  Future<Message> createNewCommunityThread() async {
    setState(ViewStateType.Processing);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = prefs.getString('userAuth')!;

    int catID = 661;

    await communityApi.addNewThread(basicAuth, communityThreadSubject, communityThreadContent, catID);

    setState(ViewStateType.Completed);
    notifyListeners();

    return Message(status: 200, title: "Success", message: "That has been processed");

  }
}

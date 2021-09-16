import 'package:shared_preferences/shared_preferences.dart';
import './../../../enum/enum.dart';
import './../../../config/config.dart';
import './../../../services/services.dart';
import './../../../models/models.dart';
import './../../../viewmodels/viewmodels.dart';

class CommunityViewModel extends BaseViewModel {
  CommunityApi communityApi = locator<CommunityApi>();
  String? basicAuth;

  String forumContent = "";
  bool likeBtn = false;

  late List<Community> communities;
  Community community = new Community(
      id: 0,
      title: "",
      timeAgo: "",
      isAdmin: false,
      currentUserLikesThread: false);

  void initialise(int id) {
    communities = [];
    setState(ViewStateType.Busy);
    notifyListeners();

    getPostsFromAPI();
    getSinglePost(id);
    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future<List<Community>> getPostsFromAPI() async {
    setState(ViewStateType.Busy);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    basicAuth = prefs.getString("userAuth");

    communities = await communityApi.getPosts(basicAuth!);

    setState(ViewStateType.Completed);
    notifyListeners();

    return communities;
  }

  Future getSinglePostFromAPI(postData) async {
    setState(ViewStateType.Busy);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    basicAuth = prefs.getString("userAuth");
    community = await communityApi.getPost(basicAuth!, postData["id"]);

    setState(ViewStateType.Completed);
    notifyListeners();
  }

  Future<Community> getSinglePost(int id) async {
    setState(ViewStateType.Busy);
    notifyListeners();

    community = Community(
        id: 0,
        title: '',
        timeAgo: '',
        isAdmin: false,
        currentUserLikesThread: false);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    basicAuth = prefs.getString("userAuth");
    community = await communityApi.getPost(basicAuth!, id);

    setState(ViewStateType.Completed);
    notifyListeners();

    return community;
  }

  Future<Message> replyToThread(int parentID, String content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = prefs.getString('userAuth')!;

    await communityApi.replyToThread(basicAuth, "", content, parentID);

    setState(ViewStateType.Completed);
    notifyListeners();

    return Message(
        status: 200, title: "Success", message: "That has been processed");
  }

  void likeThread(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = prefs.getString('userAuth')!;
    int like = 1;
    // likeBtn = true;
    await communityApi.likeAThread(basicAuth, id, like);
    notifyListeners();
  }

  void followThread(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = prefs.getString('userAuth')!;
    int folow = 1;
    // likeBtn = true;
    await communityApi.followAThread(basicAuth, id, folow);
    notifyListeners();
  }
}

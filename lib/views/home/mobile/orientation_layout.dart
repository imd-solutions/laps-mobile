import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:html_unescape/html_unescape.dart';
import './../../../config/config.dart';
import './../../../enum/enum.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../../widgets/widgets.dart';
import './../../../views/views.dart';

class HomeViewMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel data) {
    void bottomNavOnTap(int index) {
      String showPost = "";

      switch (index) {
        case 0:
          {
            showPost = "feed";
          }
          break;
        case 1:
          {
            showPost = "advice";
          }
          break;
        case 2:
          {
            showPost = "opportunities";
          }
          break;
        case 3:
          {
            showPost = "community";
          }
          break;
        default:
          {
            showPost = "posts";
          }
          break;
      }

      if (index != 0) {
        _scaffold.currentState!.openDrawer();
      }

      data.updateSection(showPost);
      data.updateBottomNavIndex(index);
    }

    final List<Widget> _widgetOptions = <Widget>[
      HomeSection(data.section, context: context, data: data),
      PrepareSection(data.section, context: context, data: data),
      OpportunitySection(data.section, context: context, data: data),
      GetInvolvedSection(data.section, context: context, data: data),
    ];

    final List<Widget> _drawerItems = <Widget>[
      HomeDrawer(context, data),
      Column(
        children: [
          UserInformationDrawer(context, data),
          PrepareDrawer(context, data),
          Divider(),
          FeedBackDrawer(),
          TermsConditionsDrawer(),
        ],
      ),
      Column(
        children: [
          UserInformationDrawer(context, data),
          OpportunitiesDrawer(context, data),
          Divider(),
          FeedBackDrawer(),
          TermsConditionsDrawer(),
        ],
      ),
      Column(
        children: [
          UserInformationDrawer(context, data),
          GetInvolvedDrawer(context, data),
          Divider(),
          FeedBackDrawer(),
          TermsConditionsDrawer(),
        ],
      ),
    ];

    return FullBusyOverlay(
      show: data.state == ViewStateType.Busy,
      child: Scaffold(
          key: _scaffold,
          drawer: Drawer(
            child: data.state != ViewStateType.Busy
                ? _drawerItems.elementAt(data.bottomNavIndex)
                : null,
          ),
          body: SafeArea(
            child: Column(
              key: ValueKey('userWelcome'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeApplicationHeader(scaffoldKey: _scaffold),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    _widgetOptions.elementAt(data.bottomNavIndex),
                  ],
                ))
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: bottomNavOnTap,
            selectedItemColor: Palette.primaryColour,
            unselectedItemColor: Palette.accentThirdColour,
            currentIndex: data
                .bottomNavIndex, // this will be set when a new tab is tapped
            items: _bottomNavBarList,
          )),
    );
  }
}

List<BottomNavigationBarItem> _bottomNavBarList = [
  BottomNavigationBarItem(
    icon: Icon(Font.home),
    title: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: const Text(
        'Home',
        style: TextStyle(color: Palette.accentThirdColour),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(Font.file_empty),
    title: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: const Text(
        'Prepare',
        style: TextStyle(color: Palette.accentThirdColour),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(Font.magnifier),
    title: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: const Text(
        'Opportunities',
        style: TextStyle(color: Palette.accentThirdColour),
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(Font.users),
    title: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: const Text(
        'Get Involved',
        style: TextStyle(color: Palette.accentThirdColour),
      ),
    ),
  ),
];

Widget HomeSection(text, {context, data}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Palette.primaryColour,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                'Your Feed',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: Font.primaryFont,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (data.state != ViewStateType.Busy && data.feed.length > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ListView.builder(
                    itemCount: data.feed.length,
                    itemBuilder: (context, i) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.feed[i].type == "html")
                          Html(data: data.feed[i].content),
                        if (data.feed[i].type == "events")
                          EventFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "job")
                          JobFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "post")
                          PostFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "videos")
                          VideoFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "ad")
                          AdFeed(context, data.feed[i]),
                        if (data.feed[i].type == "haveYouThoughtAbout")
                          YourThoughtsFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "community")
                          CommunityFeed(context, data.feed[i], data),
                        if (data.feed[i].type == "missing")
                          MissingFeed(context, data.feed[i], data),
                      ],
                    ),
                  )),
            )
        ],
      ),
    ),
  );
}

Widget PrepareSection(text, {context, data}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Palette.primaryColour,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                data.section,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: Font.primaryFont,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (data.state != ViewStateType.Busy)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: data.section == 'Advice'
                    ? ListView.builder(
                        itemCount: data.advices.length,
                        itemBuilder: (context, i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (data.advices[i].acf?.featuredImage != null)
                              Container(
                                height: 200.0,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        data.advices[i].acf!.featuredImage.url),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(data.advices[i].title.rendered),
                            SizedBox(
                              height: 10.0,
                            ),
                            ElevatedButton(
                              child: data.state == ViewStateType.Processing
                                  ? SizedBox(
                                      height: 15.0,
                                      width: 15.0,
                                      child: CircularProgressIndicator(
                                        key: const ValueKey(
                                            "siteProgressIndicator"),
                                        strokeWidth: 2.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Palette.whiteColour,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      'View',
                                      key: const ValueKey("viewPostBtn"),
                                      style: TextStyle(
                                        color: Palette.blackColour,
                                        fontFamily: Font.secondaryFont,
                                        fontSize: 13.5,
                                      ),
                                    ),
                              style: ElevatedButton.styleFrom(
                                primary: Palette.primaryColour,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () {
                                dynamic items = {
                                  "id": data.advices[i].id,
                                  "post": "advice"
                                };
                                Navigator.pushNamed(context, AdviceViewRoute,
                                    arguments: items);
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ),
                      )
                    : data.section == 'Careers'
                        ? ListView.builder(
                            itemCount: data.careers.length,
                            itemBuilder: (context, i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data.careers[i].acf?.featuredImage != null)
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      data.careers[i].acf!.featuredImage.url,
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Palette.primaryColour,
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      dynamic items = {
                                        "id": int.parse(
                                            data.careers[i].laps.sectorId),
                                        "post": "sectors"
                                      };
                                      Navigator.pushNamed(
                                          context, CareerViewRoute,
                                          arguments: items);
                                    },
                                    child: Html(
                                        data: data.careers[i].title.rendered),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          )
                        : data.section == 'Interviews'
                            ? ListView.builder(
                                itemCount: data.videos.length,
                                itemBuilder: (context, i) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Image.network(
                                      data.videos[i].laps
                                          .youtubeImage, // this image doesn't exist
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          // color: Colors.amber,
                                          alignment: Alignment.center,
                                          child: Text(
                                            '404 - NO IMAGE AT: ${data.image}',
                                            style: TextStyle(fontSize: 15.5),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 10.0),
                                      child: Text(
                                        data.videos[i].title.rendered,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    Html(data: data.videos[i].acf.overview),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          child: Text(
                                            'View Interview',
                                            key: const ValueKey("viewFeedBtn"),
                                            style: TextStyle(
                                              color: Palette.blackColour,
                                              fontFamily: Font.secondaryFont,
                                              fontSize: 13.5,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Palette.primaryColour,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      0.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            navigateToUrl(
                                                data.videos[i].acf.embedLink);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              )
                            : Text(data.section),
              ),
            )
        ],
      ),
    ),
  );
}

Widget OpportunitySection(text, {context, data}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Palette.primaryColour,
                    width: 1.0,
                  ),
                ),
              ),
              child: Text(
                data.section,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: Font.primaryFont,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (data.state != ViewStateType.Busy && data.advices.length > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: data.section == 'Opportunities'
                    ? JobView()
                    : data.section == 'Franchises'
                        ? ListView.builder(
                            itemCount: data.franchises.length,
                            itemBuilder: (context, i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (data.franchises[i].acf?.logo != null)
                                  Container(
                                    height: 200.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            data.franchises[i].acf!.logo.url),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  data.franchises[i].title.rendered,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  child: data.state == ViewStateType.Processing
                                      ? SizedBox(
                                          height: 15.0,
                                          width: 15.0,
                                          child: CircularProgressIndicator(
                                            key: const ValueKey(
                                                "siteProgressIndicator"),
                                            strokeWidth: 2.0,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Palette.whiteColour,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          'View',
                                          key: const ValueKey("viewPostBtn"),
                                          style: TextStyle(
                                            color: Palette.blackColour,
                                            fontFamily: Font.secondaryFont,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Palette.primaryColour,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    dynamic items = {
                                      "id": data.franchises[i].id,
                                      "post": "franchises"
                                    };
                                    Navigator.pushNamed(
                                        context, FranchiseViewRoute,
                                        arguments: items);
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          )
                        : data.section == 'Courses'
                            ? Text(data.section)
                            : Text(data.section),
              ),
            )
        ],
      ),
    ),
  );
}

Widget GetInvolvedSection(text, {context, data}) {
  final DateFormat WpDate = DateFormat('EEEE dd MMM yyyy');
  final DateFormat WpTime = DateFormat('jm');
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  var unescape = HtmlUnescape();

  String getReplyString(int reply) {
    if (reply == 1) {
      return "reply";
    }
    return "replies";
  }

  void navigateToSinglePost(int index, String post, int id) {
    data.updatePostId(post, id);
    updateNavigationIndex(index, data, post);
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          padding: EdgeInsets.only(
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Palette.primaryColour,
                width: 1.0,
              ),
            ),
          ),
          child: Text(
            data.section,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: Font.primaryFont,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: data.section == 'Community'
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Following",
                          style: TextStyle(
                              fontSize: 20.0, fontFamily: Font.secondaryFont),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        for (var i = 0; i < data.following.length; i++)
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => navigateToSinglePost(
                                    3, "forum", data.following[i].id),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Palette.greyColour)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 50.0,
                                            width:
                                                50.0, // fixed width and height
                                            child: Image.network(
                                                data.following[i].image),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(data.following[i].title),
                                          Text(data.following[i].name),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              )
                            ],
                          ),
                        SizedBox(
                          height: 25.0,
                        ),
                        ElevatedButton(
                          child: Text(
                            'Add New Thread',
                            key: const ValueKey("viewPostBtn"),
                            style: TextStyle(
                              color: Palette.blackColour,
                              fontFamily: Font.secondaryFont,
                              fontSize: 13.5,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Palette.primaryColour,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0.0),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              enableDrag: true,
                              isDismissible: true,
                              useRootNavigator: true,
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 20.0),
                                          child: Text(
                                            "New Thread",
                                            style: TextStyle(fontSize: 30.0),
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            children: <Widget>[
                                              InputText(
                                                keyWord: "inputSubject",
                                                icon: Icons.add,
                                                hintText: 'Subject',
                                                isEmail: true,
                                                validator:
                                                    FormValidator.validateEmail,
                                                onChanged: (String? value) {
                                                  data.updateCommunityThreadSubject(
                                                      value);
                                                },
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0, right: 15.0),
                                                child: TextField(
                                                  controller: _controller,
                                                  onChanged: (text) => data
                                                      .updateCommunityThreadContent(
                                                          text),
                                                  autofocus: true,
                                                  cursorColor:
                                                      Palette.primaryColour,
                                                  style: TextStyle(height: 1.0),
                                                  cursorWidth: 2.0,
                                                  maxLines: 5,
                                                  minLines: 3,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    filled: true,
                                                    fillColor:
                                                        Palette.greyColour,
                                                    hintText: "Thread Content",
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    ElevatedButton(
                                                      child: data.state ==
                                                              ViewStateType
                                                                  .Processing
                                                          ? SizedBox(
                                                              height: 15.0,
                                                              width: 15.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                key: const ValueKey(
                                                                    "siteProgressIndicator"),
                                                                strokeWidth:
                                                                    2.0,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Palette
                                                                      .whiteColour,
                                                                ),
                                                              ),
                                                            )
                                                          : Text(
                                                              'Submit',
                                                              key: const ValueKey(
                                                                  "communitySubmitBtn"),
                                                              style: TextStyle(
                                                                color: Palette
                                                                    .accentSecondColour,
                                                                fontFamily: Font
                                                                    .secondaryFont,
                                                                fontSize: 13.5,
                                                              ),
                                                            ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Palette
                                                            .primaryColour,
                                                        shape:
                                                            new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        data
                                                            .createNewCommunityThread()
                                                            .then((info) =>
                                                                Navigator.pop(
                                                                    context));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              // registerForgottenPassword(context, data),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Container(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Palette.primaryColour,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Title'),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.communities.length,
                          itemBuilder: (context, i) => GestureDetector(
                            onTap: () => navigateToSinglePost(
                                3, "forum", data.communities[i].id),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Palette.greyColour)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          data.communities[i].image != ""
                                              ? Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(data
                                                          .communities[i]
                                                          .image),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 50.0,
                                                  width:
                                                      50.0, // fixed width and height
                                                  child: Image.asset(
                                                      'assets/images/user/no-user.png'),
                                                ),
                                          SizedBox(width: 5.0),
                                          Expanded(
                                              child: Html(
                                                  data: data
                                                      .communities[i].title)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(data.communities[i].timeAgo),
                                  Text(
                                      '${data.communities[i].reply.toString()} ${getReplyString(data.communities[i].reply)}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : data.section == 'Events'
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.events.length,
                        itemBuilder: (context, i) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (data.events[i].acf?.listImage != null)
                              Container(
                                height: 200.0,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        data.events[i].acf!.listImage.url),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(unescape
                                .convert(data.events[i].title.rendered)),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Date and Time"),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                                "${data.events[i].acf.startTime} - ${data.events[i].acf.endTime}"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Html(
                              data: data.events[i].acf.address,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  child: data.state == ViewStateType.Processing
                                      ? SizedBox(
                                          height: 15.0,
                                          width: 15.0,
                                          child: CircularProgressIndicator(
                                            key: const ValueKey(
                                                "siteProgressIndicator"),
                                            strokeWidth: 2.0,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Palette.whiteColour,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          'View',
                                          key: const ValueKey("viewPostBtn"),
                                          style: TextStyle(
                                            color: Palette.blackColour,
                                            fontFamily: Font.secondaryFont,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Palette.primaryColour,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    dynamic items = {
                                      "id": data.events[i].id,
                                      "post": "events"
                                    };
                                    Navigator.pushNamed(context, EventViewRoute,
                                        arguments: items);
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                ElevatedButton(
                                  child: data.state == ViewStateType.Processing
                                      ? SizedBox(
                                          height: 15.0,
                                          width: 15.0,
                                          child: CircularProgressIndicator(
                                            key: const ValueKey(
                                                "siteProgressIndicator"),
                                            strokeWidth: 2.0,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Palette.whiteColour,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          'Register',
                                          key: const ValueKey("viewPostBtn"),
                                          style: TextStyle(
                                            color: Palette.whiteColour,
                                            fontFamily: Font.secondaryFont,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Palette.blackColour,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    dynamic items = {
                                      "id": data.events[i].id,
                                      "post": "events"
                                    };
                                    Navigator.pushNamed(context, EventViewRoute,
                                        arguments: items);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ),
                      )
                    : data.section == 'Posts'
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.posts.length,
                            itemBuilder: (context, i) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          data.posts[i].acf!.bannerImage.url),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(data.posts[i].title.rendered),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${WpDate.format(data.posts[i].date)} at ${WpTime.format(data.posts[i].date)}",
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                ElevatedButton(
                                  child: data.state == ViewStateType.Processing
                                      ? SizedBox(
                                          height: 15.0,
                                          width: 15.0,
                                          child: CircularProgressIndicator(
                                            key: const ValueKey(
                                                "siteProgressIndicator"),
                                            strokeWidth: 2.0,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Palette.whiteColour,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          'View',
                                          key: const ValueKey("viewPostBtn"),
                                          style: TextStyle(
                                            color: Palette.blackColour,
                                            fontFamily: Font.secondaryFont,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Palette.primaryColour,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    dynamic items = {
                                      "id": data.posts[i].id,
                                      "post": "posts"
                                    };
                                    Navigator.pushNamed(context, PostViewRoute,
                                        arguments: items);
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          )
                        : data.section == 'Forum'
                            ? ForumView(arguments: data.forumId)
                            : Text(data.section),
          ),
        ],
      )
    ],
  );
}

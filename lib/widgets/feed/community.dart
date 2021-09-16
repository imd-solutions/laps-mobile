import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import './../../viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget CommunityFeed(BuildContext context, data, HomeViewModel homeData) {
  var unescape = HtmlUnescape();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(
        uColour: Palette.primaryColour,
        textColour: Palette.blackColour,
        textTitle: "Community",
        link: "community",
        index: 3,
        homeData: homeData,
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          data.image != ''
              ? CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(data.image),
                  backgroundColor: Colors.transparent,
                )
              : CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/user/no-user.png'),
                  backgroundColor: Colors.transparent,
                ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name),
              SizedBox(
                height: 10.0,
              ),
              if (data.isAdmin) Text("LAPS Admin"),
              SizedBox(
                height: 10.0,
              ),
              Text(data.date),
            ],
          )
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            unescape.convert(data.title),
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Html(data: data.content)
        ],
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        children: [
          Icon(
            Icons.thumb_up_outlined,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(data.likes.toString()),
          SizedBox(
            width: 20.0,
          ),
          Icon(
            Icons.mode_comment_outlined,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            data.replies.toString(),
          ),
          SizedBox(
            width: 30.0,
          ),
          ElevatedButton(
            child: Text(
              'View',
              key: const ValueKey("viewCommunityBtn"),
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
              dynamic items = {"id": data.id, "post": "advice"};
              Navigator.pushNamed(context, AdviceViewRoute, arguments: items);
            },
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            child: Text(
              'Reply',
              key: const ValueKey("replyCommunityBtn"),
              style: TextStyle(
                color: Palette.whiteColour,
                fontFamily: Font.secondaryFont,
                fontSize: 13.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Palette.blackColour,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0.0),
              ),
            ),
            onPressed: () {
              dynamic items = {"id": data.id, "post": "advice"};
              Navigator.pushNamed(context, AdviceViewRoute, arguments: items);
            },
          ),
        ],
      ),
      SizedBox(
        height: 20.0,
      ),
      Divider(),
    ],
  );
}

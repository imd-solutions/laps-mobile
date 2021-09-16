import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:laps/viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget PostFeed(BuildContext context, data, HomeViewModel homeData) {
  var unescape = HtmlUnescape();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(uColour: Palette.primaryColour, textColour: Palette.blackColour, textTitle: "Articles", link: "posts", index: 3, homeData: homeData,),
      SizedBox(
        height: 15.0,
      ),
      Align(
        child: Image.network(
          data.image, // this image doesn't exist
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
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
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        unescape.convert(data.title),
        style: TextStyle(fontSize: 20.0),
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(data.date),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          ElevatedButton(
            child: Text(
              'View',
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
                borderRadius: new BorderRadius.circular(0.0),
              ),
            ),
            onPressed: () {
              dynamic items = {"id": data.id, "post": "posts"};
              Navigator.pushNamed(context, PostViewRoute, arguments: items);
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

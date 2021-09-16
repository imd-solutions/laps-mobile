import 'package:flutter/material.dart';
import 'package:laps/viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget JobFeed(BuildContext context, data, HomeViewModel homeData) {
  String url = "https://laps-app.phase4web.com";
  var image = data.image as Map;
  String imgUrl = '$url${image["Url"]}';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(
        uColour: Palette.primaryColour,
        textColour: Palette.blackColour,
        textTitle: "Opportunity",
        link: "opportunities",
        index: 2,
        homeData: homeData,
      ),
      SizedBox(
        height: 15.0,
      ),
      if (image["Url"] != null)
        Align(
          child: Image.network(
            imgUrl, // this image doesn't exist
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                // color: Colors.amber,
                alignment: Alignment.center,
                child: Text(
                  '404 - NO IMAGE AT: ${image["Url"]}',
                  style: TextStyle(fontSize: 15.5),
                ),
              );
            },
          ),
        ),
      SizedBox(
        height: 10.0,
      ),
      Text(data.title),
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
              dynamic items = {"id": data.id, "post": "advice"};
              Navigator.pushNamed(context, AdviceViewRoute, arguments: items);
            },
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            child: Text(
              'Apply',
              key: const ValueKey("bookFeedBtn"),
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
      SizedBox(
        height: 20.0,
      ),
      Divider(),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:laps/viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget VideoFeed(BuildContext context, data, HomeViewModel homeData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(
        uColour: Palette.primaryColour,
        textColour: Palette.blackColour,
        textTitle: "Interview",
        link: "videos",
        index: 1,
        homeData: homeData,
      ),
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
        data.title,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Html(data: data.overview),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          ElevatedButton(
            child: Text(
              'Read More',
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
              dynamic items = {"id": data.id, "post": "videos", "data": data.image};
              Navigator.pushNamed(context, VideoViewRoute, arguments: items);
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

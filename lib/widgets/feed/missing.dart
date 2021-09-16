import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget MissingFeed(BuildContext context, data, feedData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(
        uColour: Palette.primaryColour,
        textColour: Palette.blackColour,
        textTitle: "Your Profile",
        link: "profile",
        index: 0,
        homeData: feedData,
      ),
      SizedBox(
        height: 15.0,
      ),
      Row(
        children: [
          Icon(
            Icons.report_problem_outlined,
            color: Palette.redColour,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text("You are missing details from your LAPS profile:")
        ],
      ),
      SizedBox(
        height: 5.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < data.missing.length; i++) Text("• ${data.missing[i]}"),
        ],
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          ElevatedButton(
            child: Text(
              'Update Profile',
              key: const ValueKey("updateProfileBtn"),
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
            onPressed: () {},
          ),
        ],
      ),
      Divider(),
    ],
  );
}

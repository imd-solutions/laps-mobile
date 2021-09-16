import 'package:flutter/material.dart';
import 'package:laps/viewmodels/home_viewmodel.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget EventFeed(BuildContext context, data, HomeViewModel homeData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(uColour: Palette.primaryColour, textColour: Palette.blackColour, textTitle: "Upcoming Event", link: "events", index: 3, homeData: homeData),
      SizedBox(
        height: 10.0,
      ),
      Align(
        child: Image(image: NetworkImage(data.image), fit: BoxFit.fitWidth),
      ),
      SizedBox(
        height: 10.0,
      ),
      data.title != null ? Text(data.title!) : Text(''),
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
              dynamic items = {"id": data.id, "post": "events"};
              Navigator.pushNamed(context, EventViewRoute, arguments: items);
            },
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            child: Text(
              'Book Now',
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
      Divider()
    ],
  );
}

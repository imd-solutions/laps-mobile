import 'package:flutter/material.dart';
import 'package:laps/viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';

Widget YourThoughtsFeed(BuildContext context, data, HomeViewModel homeData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FeedHeader(uColour: Palette.primaryColour, textColour: Palette.blackColour, textTitle: "Have Your Thoughts", link: "your_thoughts", index: 1, homeData: homeData,),
      SizedBox(
        height: 15.0,
      ),
      Container(
        height: 250.0,
        child: ListView.builder(
          itemCount: data.roles.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.add_circle_outline_sharp),
            title: Text(data.roles[i].title),
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Divider(),
    ],
  );
}

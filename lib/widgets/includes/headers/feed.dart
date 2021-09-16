import 'package:flutter/material.dart';
import './../../../viewmodels/viewmodels.dart';

class FeedHeader extends StatelessWidget {
  final Color uColour;
  final String textTitle;
  final Color textColour;
  final String link;
  final int index;
  final HomeViewModel homeData;

  FeedHeader({required this.uColour, required this.textColour, required this.textTitle, required this.link, required this.index, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: 5.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: uColour,
                width: 4.0, // Underline thickness
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              homeData.updateSection(link);
              homeData.updateBottomNavIndex(index);
            },
            child: Text(
              textTitle,
              style: TextStyle(
                color: textColour,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 35.0,
        ),
        Icon(Icons.arrow_forward, size: 15.0)
      ],
    );
  }
}

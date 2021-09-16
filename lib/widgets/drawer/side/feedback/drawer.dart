import 'package:flutter/material.dart';
import './../../../../config/config.dart';

Widget FeedBackDrawer() {
  return ListTile(
    leading: new Icon(Icons.favorite_border_rounded),
    title: GestureDetector(onTap: () => navigateToUrl('mailto:feedback@laps.careers?subject=Feedback'), child: Text("Feedback")),
  );
}

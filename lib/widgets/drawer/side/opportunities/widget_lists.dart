import 'package:flutter/material.dart';
import './../../../../viewmodels/home_viewmodel.dart';
import './../../../../config/config.dart';

List<Widget> OpportunitiesWidgetList(BuildContext context, HomeViewModel data) {
  return [
    if (data.bottomNavIndex != 0)
      GestureDetector(
        onTap: () => updateNavigationIndexPop(0, context, data, "feed"),
        child: ListTile(
          leading: new Icon(Font.home),
          title: Text("Home"),
        ),
      ),
    GestureDetector(
      onTap: () => updateNavigationIndex(2, data, "opportunities"),
      child: ListTile(
        leading: new Icon(Font.magnifier),
        title: Text("Opportunities"),
      ),
    ),
    Column(
      children: [
        GestureDetector(
          onTap: () => updateNavigationIndexPop(2, context, data, "opportunities"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("View Latest", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(2, context, data, "franchises"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Franchises", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(2, context, data, "courses"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Courses", style: TextStyle(fontSize: 12.5)),
          ),
        ),
      ],
    ),
  ];
}

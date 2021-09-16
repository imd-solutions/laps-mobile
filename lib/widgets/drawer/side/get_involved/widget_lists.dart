import 'package:flutter/material.dart';
import './../../../../viewmodels/home_viewmodel.dart';
import './../../../../config/config.dart';

GetInvolvedWidgetList(BuildContext context, HomeViewModel data) {
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
      onTap: () => updateNavigationIndex(3, data, "community"),
      child: ListTile(
        leading: new Icon(Font.users),
        title: Text("Get Involved"),
      ),
    ),
    Column(
      children: [
        GestureDetector(
          onTap: () => updateNavigationIndexPop(3, context, data, "community"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Community", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(3, context, data, "posts"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Blog", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(3, context, data, "events"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Events", style: TextStyle(fontSize: 12.5)),
          ),
        ),
      ],
    ),
  ];
}

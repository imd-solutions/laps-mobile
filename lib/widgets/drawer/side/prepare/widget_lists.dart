import 'package:flutter/material.dart';
import './../../../../viewmodels/home_viewmodel.dart';
import './../../../../config/config.dart';

List<Widget> PrepareWidgetList(BuildContext context, HomeViewModel data) {
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
      onTap: () => updateNavigationIndex(1, data, "advice"),
      child: ListTile(
        leading: new Icon(Font.file_empty),
        title: Text("Prepare"),
      ),
    ),
    Column(
      children: [
        GestureDetector(
          onTap: () => updateNavigationIndexPop(1, context, data, "advice"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Advice", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(1, context, data, "careers"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Careers", style: TextStyle(fontSize: 12.5)),
          ),
        ),
        GestureDetector(
          onTap: () => updateNavigationIndexPop(1, context, data, "interviews"),
          child: ListTile(
            minVerticalPadding: 0.0,
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            dense: true,
            leading: new Icon(Icons.arrow_forward, size: 20.0),
            title: Text("Interviews", style: TextStyle(fontSize: 12.5)),
          ),
        ),
      ],
    ),
  ];
}

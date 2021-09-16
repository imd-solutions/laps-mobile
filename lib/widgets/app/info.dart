import 'package:flutter/material.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../config/config.dart';
import './../../enum/enum.dart';

class AppInfo extends StatelessWidget {
  final HomeViewModel data;

  AppInfo(this.data);

  @override
  Widget build(BuildContext context) {
    return data.state == ViewStateType.Completed
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    "Homepage",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: Font.primaryFont,
                    ),
                  ),
                )
              ],
            ),
          )
        : Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text("Loading..."),
            ),
          );
  }
}

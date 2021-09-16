import 'package:flutter/material.dart';
import './../../../models/models.dart';
import './../../../config/config.dart';

class HomeApplicationHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  HomeApplicationHeader({required GlobalKey<ScaffoldState> scaffoldKey}) : _scaffoldKey = scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        Image.asset(
          'assets/images/logo.png',
          height: 50.0,
        ),
        IconButton(
          onPressed: () => print('BELL'),
          icon: Icon(Font.chat, color: Palette.accentSecondColour),
        ),
      ],
    );
  }
}

class ApplicationHeader extends StatelessWidget {
  final User user;
  final String route;
  final String information;

  const ApplicationHeader({required Key key, required this.user, required this.route, required this.information}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 35.0,
            ),
          ],
        ),
      ],
    );
  }
}

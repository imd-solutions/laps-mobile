import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../widgets/widgets.dart';
import '../../../config/config.dart';

class AppDrawerView extends StatelessWidget {
  final Application application;
  AppDrawerView(this.application);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      width: orientation == Orientation.portrait ? 200.0 : 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15.0,
            color: Colors.black12,
          )
        ],
      ),
      child: SafeArea(
        child: SideDrawer(
          orientation: orientation,
          width: double.infinity,
          height: orientation == Orientation.portrait ? 150.0 : 75.0,
          colour: Palette.primaryColour,
          showProfile: orientation == Orientation.portrait,
          profileRadius: orientation == Orientation.portrait ? 40.0 : 20.0,
          profileTitle: 'TestTitle',
          profileColour: Palette.greyColour,
          profileSubTitle: 'SubTitle',
          application: application,
        ),
      ),
    );
  }
}

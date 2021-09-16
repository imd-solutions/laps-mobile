import 'package:flutter/material.dart';
import './../../../../config/config.dart';

Widget TermsConditionsDrawer() {
  return ListTile(
    leading: new Icon(Icons.info_outline),
    title: GestureDetector(
      onTap: () => navigateToUrl('https://www.laps.careers/privacy-policy/'),
      child: Text("Terms & Conditions"),
    ),
  );
}

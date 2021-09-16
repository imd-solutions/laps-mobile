import 'package:flutter/material.dart';
import './../../config/config.dart';

Widget AdFeed(BuildContext context, data) {
  return Column(
    children: [
      Align(
        child: GestureDetector(
          onTap: () => navigateToUrl(data.link),
          child: Image(image: NetworkImage(data.mobileImage), fit: BoxFit.fitWidth),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Divider()
    ],
  );
}

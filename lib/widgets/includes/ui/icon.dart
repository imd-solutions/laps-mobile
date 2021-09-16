import 'package:flutter/material.dart';

Widget buildIcon(BuildContext context, double logoHeight) => Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            key: const ValueKey("siteLogo"),
            fit: BoxFit.fill,
            height: logoHeight,
          ),
        ],
      ),
    );

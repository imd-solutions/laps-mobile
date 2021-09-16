import 'package:flutter/material.dart';
import './../../../../viewmodels/viewmodels.dart';
import '../../../widgets.dart';

Widget PrepareDrawer(BuildContext context, HomeViewModel data) {
  return Column(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: PrepareWidgetList(context, data),
            ),
          ],
        ),
      )
    ],
  );
}

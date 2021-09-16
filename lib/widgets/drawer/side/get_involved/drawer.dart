import 'package:flutter/material.dart';
import './../../../../viewmodels/viewmodels.dart';
import '../../../widgets.dart';

Widget GetInvolvedDrawer(BuildContext context, HomeViewModel data) {
  return Column(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: GetInvolvedWidgetList(context, data),
            ),
          ],
        ),
      )
    ],
  );
}

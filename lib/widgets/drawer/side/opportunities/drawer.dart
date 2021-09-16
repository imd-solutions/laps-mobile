import 'package:flutter/material.dart';
import './../../../../viewmodels/viewmodels.dart';
import '../../../widgets.dart';

Widget OpportunitiesDrawer(BuildContext context, HomeViewModel data) {
  return Column(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: OpportunitiesWidgetList(context, data),
            ),
          ],
        ),
      )
    ],
  );
}

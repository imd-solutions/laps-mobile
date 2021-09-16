import 'package:flutter/material.dart';
import './../../../viewmodels/home_viewmodel.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';

Widget HomeDrawer(BuildContext context, HomeViewModel data) {
  return Column(
    children: [
      UserInformationDrawer(context, data),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => updateNavigationIndexPop(0, context, data, "feed"),
                child: ListTile(
                  leading: new Icon(Font.home),
                  title: Text("Home"),
                ),
              ),
              PrepareDrawer(context, data),
              OpportunitiesDrawer(context, data),
              GetInvolvedDrawer(context, data),
              Divider(),
              FeedBackDrawer(),
              TermsConditionsDrawer(),
            ],
          ),
        ),
      )
    ],
  );
}

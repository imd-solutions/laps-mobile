import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class ForumView extends StatelessWidget {
  final dynamic arguments;

  ForumView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BaseWidget<CommunityViewModel>(
        viewModel: CommunityViewModel(),
        onModelReady: (model) => model.initialise(arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => ForumViewMobilePortrait(),
            landscape: (context) => ForumViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => ForumViewMobilePortrait(),
            landscape: (context) => ForumViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

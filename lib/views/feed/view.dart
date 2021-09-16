import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class FeedView extends StatelessWidget {

  FeedView();

  @override
  Widget build(BuildContext context) {

    // print(this.arguments);

    return Center(
      child: BaseWidget<FeedViewModel>(
        viewModel: FeedViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => FeedViewMobilePortrait(),
            landscape: (context) => FeedViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => FeedViewMobilePortrait(),
            landscape: (context) => FeedViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

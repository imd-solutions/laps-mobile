import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class VideoView extends StatelessWidget {
  final dynamic arguments;

  VideoView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    // print(this.arguments);

    return Center(
      child: BaseWidget<VideoViewModel>(
        viewModel: VideoViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => VideoViewMobilePortrait(),
            landscape: (context) => VideoViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => VideoViewMobilePortrait(),
            landscape: (context) => VideoViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

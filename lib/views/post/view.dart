import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class PostView extends StatelessWidget {
  final dynamic arguments;

  PostView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    // print(this.arguments);

    return Center(
      child: BaseWidget<PostViewModel>(
        viewModel: PostViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => PostViewMobilePortrait(),
            landscape: (context) => PostViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => PostViewMobilePortrait(),
            landscape: (context) => PostViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

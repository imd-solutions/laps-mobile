import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class JobView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BaseWidget<JobViewModel>(
        viewModel: JobViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => JobViewMobilePortrait(),
            landscape: (context) => JobViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => JobViewMobilePortrait(),
            landscape: (context) => JobViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

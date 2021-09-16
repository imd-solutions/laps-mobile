import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class AdviceView extends StatelessWidget {
  final dynamic arguments;

  AdviceView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BaseWidget<AdviceViewModel>(
        viewModel: AdviceViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => AdviceViewMobilePortrait(),
            landscape: (context) => AdviceViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => AdviceViewMobilePortrait(),
            landscape: (context) => AdviceViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

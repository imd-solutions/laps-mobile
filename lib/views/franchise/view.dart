import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class FranchiseView extends StatelessWidget {
  final dynamic arguments;

  FranchiseView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BaseWidget<FranchiseViewModel>(
        viewModel: FranchiseViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => FranchiseViewMobilePortrait(),
            landscape: (context) => FranchiseViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => FranchiseViewMobilePortrait(),
            landscape: (context) => FranchiseViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class CareerView extends StatelessWidget {
  final dynamic arguments;

  CareerView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BaseWidget<CareerViewModel>(
        viewModel: CareerViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => CareerViewMobilePortrait(),
            landscape: (context) => CareerViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => CareerViewMobilePortrait(),
            landscape: (context) => CareerViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

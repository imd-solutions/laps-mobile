import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class RoleView extends StatelessWidget {
  final dynamic arguments;

  RoleView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: BaseWidget<RoleViewModel>(
        viewModel: RoleViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => RoleViewMobilePortrait(),
            landscape: (context) => RoleViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => RoleViewMobilePortrait(),
            landscape: (context) => RoleViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

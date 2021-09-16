import 'package:flutter/material.dart';
import './../../config/config.dart';
import './../../widgets/widgets.dart';
import './../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => HomeViewMobilePortrait(),
          landscape: (context) => HomeViewMobilePortrait(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => HomeViewMobilePortrait(),
          landscape: (context) => HomeViewMobilePortrait(),
        ),
      ),
    );
  }
}

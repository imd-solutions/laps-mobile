import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../../views/views.dart';

class ForgottenPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ForgottenPasswordViewModel>(
      viewModel: ForgottenPasswordViewModel(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => ForgottenPasswordMobilePortrait(),
          landscape: (context) => ForgottenPasswordMobilePortrait(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => ForgottenPasswordMobilePortrait(),
          landscape: (context) => ForgottenPasswordMobilePortrait(),
        ),
      ),
    );
  }
}

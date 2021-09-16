import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../../views/views.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(),
      builder: (context) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobilePortrait(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => LoginMobilePortrait(),
          landscape: (context) => LoginMobilePortrait(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './../../../config/config.dart';
import './../../../widgets/widgets.dart';
import './../../../viewmodels/viewmodels.dart';
import './../../views/views.dart';

class EventView extends StatelessWidget {
  final dynamic arguments;

  EventView({required this.arguments});

  @override
  Widget build(BuildContext context) {

    // print(this.arguments);

    return Center(
      child: BaseWidget<EventViewModel>(
        viewModel: EventViewModel(),
        onModelReady: (model) => model.initialise(this.arguments),
        builder: (context) => ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => EventViewMobilePortrait(),
            landscape: (context) => EventViewMobilePortrait(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => EventViewMobilePortrait(),
            landscape: (context) => EventViewMobilePortrait(),
          ),
        ),
      ),
    );
  }
}

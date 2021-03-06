import 'package:flutter/material.dart';
import 'sizing_information.dart';
import 'utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      SizingInformation sizingInformation,
      ) builder;

  ResponsiveBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
import 'package:flutter/material.dart';
import './../../widgets/widgets.dart';
import './../../config/config.dart';

class FullBusyOverlay extends StatelessWidget {
  final Widget child;
  final String title;
  final bool show;

  const FullBusyOverlay({
    required this.child,
    this.title = 'Please wait...',
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          child,
          IgnorePointer(
            child: Opacity(
              opacity: show ? 1.0 : 0.0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                alignment: Alignment.center,
                color: Color.fromARGB(100, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildIcon(context, 150.0),
                    SizedBox(
                      height: 15.0,
                    ),
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Palette.primaryColour),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

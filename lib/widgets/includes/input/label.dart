import 'package:flutter/cupertino.dart';

class InputLabel extends StatelessWidget {
  final String label;
  final double pl;
  final double pt;
  final double pr;
  final double pb;

  InputLabel(
    this.label, {
    this.pl = 0,
    this.pt = 0,
    this.pr = 0,
    this.pb = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
      child: Text(
        label,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}

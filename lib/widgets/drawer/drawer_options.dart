import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';
import '../../../models/models.dart';

class DrawerOption extends BaseModelWidget<DrawerItems> {
  @override
  Widget build(BuildContext context, DrawerItems data) {
    return Container(
      height: 45.0,
      alignment: Alignment.center,
      child: Icon(data.icon),
    );
  }
}

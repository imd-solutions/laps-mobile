import 'package:flutter/material.dart';
import './../../models/models.dart';
import './../../widgets/widgets.dart';
import 'package:provider/provider.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData icon;

  DrawerOption({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: DrawerItems(title: title, icon: icon),
      child: DrawerOptionView(),
    );
  }
}

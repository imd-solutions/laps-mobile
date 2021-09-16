import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import '../../models/models.dart';

class AppDrawer extends StatelessWidget {
  final Application application;

  AppDrawer(this.application);

  @override
  Widget build(BuildContext context) {
    return AppDrawerView(application);
  }

  static List<Widget> getDrawerOptions(Application application) {
    return <Widget>[
      Row(
        children: [
          Column(
            children: [
              DrawerOption(
                title: 'Images',
                icon: Icons.image,
              ),
              DrawerOption(
                title: 'Reports',
                icon: Icons.photo_filter,
              ),
              DrawerOption(
                title: 'Incidents',
                icon: Icons.message,
              ),
              DrawerOption(
                title: 'Settings',
                icon: Icons.settings,
              ),
              SizedBox(
                height: 200.0,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Name: ${application.name} \nVersion: ${application.version}'),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text.rich(TextSpan(
                style: TextStyle(
                  fontFamily: 'SFPro-Bold',
                  fontSize: 12,
                  color: const Color(0xff000000),
                ),
                children: [
                  TextSpan(
                    text: 'Home\nPrepare',
                  ),
                  TextSpan(
                    text: '\n→  Advice \n→  Careers\n→  Interviews\n',
                    style: TextStyle(
                      fontFamily: 'SFPro-Regular',
                    ),
                  ),
                  TextSpan(
                    text: 'Opportunities',
                  ),
                  TextSpan(
                    text: '\n→ View Latest ',
                    style: TextStyle(
                      fontFamily: 'SFPro-Regular',
                    ),
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: '→ Franchises ',
                    style: TextStyle(
                      fontFamily: 'SFPro-Regular',
                    ),
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: '→ Courses\n',
                    style: TextStyle(
                      fontFamily: 'SFPro-Regular',
                    ),
                  ),
                  TextSpan(
                    text: 'Get Involved\n',
                  ),
                  TextSpan(
                    text: '→ Community\n→ Events',
                    style: TextStyle(
                      fontFamily: 'SFPro-Regular',
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      )
    ];
  }
}

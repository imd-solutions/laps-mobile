import 'package:flutter/material.dart';
import 'package:laps/config/config.dart';
import './../../../enum/enum.dart';
import './../../../viewmodels/viewmodels.dart';

Widget UserInformationDrawer(BuildContext context, HomeViewModel data) {
  return SafeArea(
    child: data.state != ViewStateType.Busy
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: data.user.avatar != '' ? NetworkImage(data.user.avatar!) : AssetImage('assets/images/user/no-user.png') as ImageProvider,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    data.logUserOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(LoginViewRoute, (Route<dynamic> route) => false);
                  },
                  child: Text('${data.profile.firstName} ${data.profile.lastName}'),
                ),
              ),
            ],
          )
        : Text(""),
  );
}

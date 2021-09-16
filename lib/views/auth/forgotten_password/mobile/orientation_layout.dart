import 'package:flutter/material.dart';
import './../../../../../models/models.dart';
import './../../../../widgets/widgets.dart';
import './../../../../viewmodels/viewmodels.dart';
import './../../../../config/config.dart';

class ForgottenPasswordMobilePortrait extends BaseModelWidget<ForgottenPasswordViewModel> {
  final _formKey = GlobalKey<FormState>();
  final User user = User();

  @override
  Widget build(BuildContext context, ForgottenPasswordViewModel data) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              buildLogo(context, 100.0),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              userEmailTextInput(user, _formKey, data),
                              SizedBox(
                                height: 10.0,
                              ),
                              forgottenPasswordBtn(context, user, _formKey, data),
                              SizedBox(height: 5.0),
                              // registerForgottenPassword(context, data),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginViewRoute, (Route<dynamic> route) => false),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  notMemberBtn(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

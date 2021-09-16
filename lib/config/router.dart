import 'package:flutter/material.dart';
import 'routing_constants.dart';
import './../views/views.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(
        builder: (context) => HomeView(),
      );
    case LoginViewRoute:
      return MaterialPageRoute(
        builder: (context) => LoginView(),
      );
    case ForgottenPasswordViewRoute:
      return MaterialPageRoute(
        builder: (context) => ForgottenPasswordView(),
      );
    case PostViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => PostView(
          arguments: arguments,
        ),
      );
    case AdviceViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => AdviceView(
          arguments: arguments,
        ),
      );
    case EventViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => EventView(
          arguments: arguments,
        ),
      );
    case FranchiseViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => FranchiseView(
          arguments: arguments,
        ),
      );
    case VideoViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => VideoView(
          arguments: arguments,
        ),
      );
    case CareerViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => CareerView(
          arguments: arguments,
        ),
      );
    case RoleViewRoute:
      var arguments = settings.arguments;
      // print(arguments);
      return MaterialPageRoute(
        builder: (context) => RoleView(
          arguments: arguments,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name!,
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/routes/routes_name.dart';
import 'package:flutter_assessment_test_rony/view/login_view.dart';
import 'package:flutter_assessment_test_rony/view/movie_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    
    switch(settings.name){

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const MovieView());

      default:
      return MaterialPageRoute(builder: (_){
        return const Scaffold(
          body: Center(
            child: Text("No Route Define"),
          ),
        );
      });
    }
  }
}
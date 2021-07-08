import 'package:btn_colores/src/ui/Seleccionados/seleccionados.dart';
import 'package:btn_colores/src/ui/home/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
static Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => MyHome());
    case '/Seleccionados':
      return MaterialPageRoute(builder: (_) => Seleccionados());
    default:
      return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context){
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Página no encontrada'),
          ),
        )
      );
    }); 
  }
}



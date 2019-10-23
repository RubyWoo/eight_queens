import 'package:flutter/material.dart';

import 'home.dart';
import 'mostrar_res.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      routes: {
        '/': (BuildContext context) => MyHomePage(), // Default Route
        '/mostrarResultados': (BuildContext context) => MostrarResultados(),
      },
    );
  }
}


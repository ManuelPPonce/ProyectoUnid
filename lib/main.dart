import 'package:flutter/material.dart';
import 'package:proyecto_gestion/src/pages/home_page.dart';
import 'package:proyecto_gestion/src/theme/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema,
      title: 'Inicio',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

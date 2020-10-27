import 'package:flutter/material.dart';

import 'menu_lateral.dart';
//import 'package:proyecto_gestion/src/pages/settings_page.dart';

class InicioPage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: crearMenuLateral(context),
    );
  }
}

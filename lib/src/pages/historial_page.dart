import 'package:flutter/material.dart';

import 'menu_lateral.dart';

class HistorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
      ),
      drawer: crearMenuLateral(context),
    );
  }
}

import 'package:flutter/material.dart';

import 'menu_lateral.dart';

//import 'package:provider/provider.dart';

class CitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas'),
      ),
      drawer: crearMenuLateral(context),
      body: Center(
        child: Text('Hola'),
      ),
    );
  }
}

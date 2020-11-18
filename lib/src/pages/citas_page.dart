import 'package:flutter/material.dart';
import 'package:proyecto_gestion/src/pages/agregar_cita.dart';

import 'menu_lateral.dart';

//import 'package:provider/provider.dart';

class CitasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Citas'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AgregarCita())))
          ],
        ),
        drawer: crearMenuLateral(context),
        body: ListView());
  }
}

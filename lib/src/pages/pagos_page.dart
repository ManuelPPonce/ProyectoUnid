import 'package:flutter/material.dart';

import 'menu_lateral.dart';

class PagosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagos'),
        ),
        drawer: crearMenuLateral(context));
  }
}

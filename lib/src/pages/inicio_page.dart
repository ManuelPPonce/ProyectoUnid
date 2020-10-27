import 'package:flutter/material.dart';
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

  Drawer crearMenuLateral(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          )),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.red,
            ),
            title: Text('Configuraciones'),
            onTap: () {
              //Navigator.pushNamed(context, SettingsPage())
            },
          )
        ],
      ),
    );
  }
}

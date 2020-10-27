import 'package:flutter/material.dart';

Drawer crearMenuLateral(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
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

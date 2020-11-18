import 'package:flutter/material.dart';
import 'package:proyecto_gestion/src/bloc/provider.dart';
import 'package:proyecto_gestion/src/pages/home_page.dart';
import 'package:proyecto_gestion/src/pages/login_page.dart';
import 'package:proyecto_gestion/src/pages/presentacion_page.dart';
import 'package:proyecto_gestion/src/pages/registro_page.dart';
import 'package:proyecto_gestion/src/preferencias_usuarios/preferencia_usuario.dart';
import 'package:proyecto_gestion/src/theme/tema.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'EU'), // English, no country code
          const Locale('es', 'ES'), // Arabic, no country code
        ],
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'Presentacion', // Aqui va Presentacion
        routes: {
          'Presentacion': (BuildContext context) => PresentacionPage(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'registro': (BuildContext context) => RegistroPage(),
        },
        theme: miTema,
      ),
    );
  }
}

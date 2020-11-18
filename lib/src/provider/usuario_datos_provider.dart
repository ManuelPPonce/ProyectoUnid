import 'dart:convert';

import 'package:http/http.dart' as htpp;
import 'package:proyecto_gestion/src/models/usuario_datos.dart';

class UsuariosDatosProvider {
  final String _url = 'https://proyectounid-5e9c8.firebaseio.com';

  Future<bool> crearUsuario(Client usuario) async {
    final url = '$_url/usuarios.json';

    final resp = await htpp.post(url, body: clientToJson(usuario));

    final decodData = json.decode(resp.body);

    print(decodData);

    return true;
  }
}

// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String id;
  String nombre;
  String apellido;
  String fecha;
  String correo;

  Client({
    this.id,
    this.nombre = "",
    this.apellido = "",
    this.fecha = "",
    this.correo = "",
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        nombre: json["Nombre"],
        apellido: json["Apellido"],
        fecha: json["Fecha"],
        correo: json["correo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Nombre": nombre,
        "Apellido": apellido,
        "Fecha": fecha,
        "correo": correo,
      };
}

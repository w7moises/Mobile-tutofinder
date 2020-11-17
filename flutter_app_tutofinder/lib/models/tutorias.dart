// To parse this JSON data, do
//
//     final tutoriaModelX = tutoriaModelXFromJson(jsonString);

import 'dart:convert';

TutoriaModelX tutoriaModelXFromJson(String str) => TutoriaModelX.fromJson(json.decode(str));

String tutoriaModelXToJson(TutoriaModelX data) => json.encode(data.toJson());

class TutoriaModelX {
  TutoriaModelX({
    this.id,
    this.nombre,
    this.status,

  });
  int id;
  String nombre;
  String status;

  factory TutoriaModelX.fromJson(Map<String, dynamic> json) => TutoriaModelX(
    id: int.tryParse(json["id"]),
    nombre: json["nombre"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id.toString(),
    "nombre": nombre,
    "status": status,
  };
}
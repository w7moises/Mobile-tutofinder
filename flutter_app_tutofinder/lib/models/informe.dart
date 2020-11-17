import 'dart:convert';

Informe informeFromJson(String str) => Informe.fromJson(json.decode(str));

String informeToJson(Informe data) => json.encode(data.toJson());

class Informe {
  Informe({
    this.id,
    this.descripcionInforme,
    this.status,
  });

  int id;
  String descripcionInforme;
  String status;

  factory Informe.fromJson(Map<String, dynamic> json) => Informe(
    id: json["id"],
    descripcionInforme: json["descripcionInforme"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "descripcionInforme": descripcionInforme,
    "status": status,
  };
}

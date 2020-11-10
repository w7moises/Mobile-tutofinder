class Docente {

  final String nombres;
  final String apellidos;

  Docente({this.nombres, this.apellidos});

  factory Docente.fromJSON(Map<String, dynamic> json){
    return Docente(
      nombres: json["nombres"],
      apellidos: json["apellidos"]
    );
  }
}

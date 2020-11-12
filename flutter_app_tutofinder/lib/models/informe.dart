class Informe{
  int id;
  String descripcionInforme;
  String status;

  Informe({this.id, this.descripcionInforme, this.status});

  Informe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descripcionInforme = json['descripcionInforme'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripcionInforme'] = this.descripcionInforme;
    data['status'] = this.status;
    return data;
  }
}
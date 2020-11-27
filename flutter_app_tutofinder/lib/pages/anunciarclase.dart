import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/models/tutorias.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'dashboard.dart';

class FormAnuncioClase extends StatefulWidget {
  @override
  _FormAnuncioClaseState createState() => _FormAnuncioClaseState();

}


class _FormAnuncioClaseState extends State<FormAnuncioClase> {

  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  Dio dio = new Dio();
  Future postData(String descripcion, int aux, int tiempo) async {

    final String pathUrl = "https://tutofinder-movil.herokuapp.com/tutorias";
    dynamic data = {
      "cantidadMinutos": tiempo,
      "descripcionTutoria": descripcion,
      "curso": {
        "id":aux,
      },
      "alumnos": [],
      "pago": {
        "id": 1,
        "descripcionPago": "tutoria X",
        "padre": {
          "id": 1,
          "nombre": "Sasha",
          "apellido": "Molina",
          "dni": "56465131",
          "correo": "ariur@gmail.com",
          "status": "CREATED"
        },
        "tarjeta": {
          "id": 1,
          "numeroTarjeta": "1468265998794632",
          "fechaExpiracion": "8/21",
          "nombrePoseedor": "Mia kalifa",
          "status": "CREATED"
        },
        "status": "CREATED"
      },
      "docente": {
        "id": 1,
        "nombre": "Moises",
        "apellido": "Molina",
        "dni": "1221315616",
        "domicilio": "av.aea",
        "correo": "w7moises@gmail.com",
        "costo": 24.5,
        "disponibilidad": true,
        "numeroCuenta": "21451234",
        "membresia": true,
        "status": "CREATED"
      },
      "informe": {
        "id": 1,
        "descripcionInforme": "Regular desempeño en fisica",
        "status": "UPDATED"
      },

    };
    var response = await dio.post(pathUrl,data:data, options: Options(
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        }
    ));

    return response.data;

  }

  Future postcurso( String nombre) async {

    final String pathUrl2 = "https://tutofinder-movil.herokuapp.com/cursos";
    dynamic data2 = {
      "nombre": nombre,
    };
    var response = await dio.post(pathUrl2,data:data2, options: Options(
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        }
    ));

    return response.data;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Crear Anuncio")),
      body:Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[

            TextField(
              decoration: InputDecoration(labelText: 'Descripción de la tutoría'),
              controller: descripcionController,
            ),

            TextField(
              decoration: InputDecoration(labelText: 'Nombre de la tutoría'),
              controller: nombreController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tiempo de la Tutoría'),
              controller: tiempoController,
            ),

            SizedBox(height: 32,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final String descripcion = descripcionController.text;
          final String nombre = nombreController.text;
          final int numero = int.tryParse(tiempoController.text);
          print("posting data...");
          var aux;
          await postcurso(nombre).then((value){
            print(value['id']);
            aux = int.tryParse(value['id'].toString());
          });
          await postData(descripcion , aux , numero);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MyApp()));

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}



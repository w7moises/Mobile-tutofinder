import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/models/tutorias.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'misanuncios.dart';

class actualizarAnuncio extends StatefulWidget {
  final int IdCurso;
  final int IdTuroria;
  final String DescripcionAnuncio;
  final String NombrenAnuncio;
  final String TiempoAnuncio;


  actualizarAnuncio(
      this.IdCurso,
      this.IdTuroria,
      this.DescripcionAnuncio,
      this.NombrenAnuncio,
      this.TiempoAnuncio,

      );

  @override
  _actualizarAnuncioState createState() => _actualizarAnuncioState();
}

class _actualizarAnuncioState extends State<actualizarAnuncio> {

  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();

  Dio dio = new Dio();

  Future updatecurso( int idcur , String nombrecur) async {

    final String pathUrl = "https://tutofinder-movil.herokuapp.com/cursos/"+idcur.toString();
    dynamic data = {
      "id": idcur,
      "nombre": nombrecur
    };
    var response = await dio.put(pathUrl,data:data, options: Options(
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        }
    ));

    return response.data;

  }

  Future updatetutoria( int idtutoria ,int idcursitos, String descripcion, int tiempo ) async {

    final String pathUrl3 = "https://tutofinder-movil.herokuapp.com/tutorias/"+idtutoria.toString();
    dynamic data3 = {
      "id": idtutoria,
      "cantidadMinutos": tiempo,
      "descripcionTutoria": descripcion,
      "curso": {
        "id":idcursitos,
      },
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

    };
    var response = await dio.put(pathUrl3,data:data3, options: Options(
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        }
    ));

    return response.data;

  }

  @override
  Widget build(BuildContext context) {
    descripcionController.text = widget.DescripcionAnuncio;
    tiempoController.text = widget.TiempoAnuncio;
    nombreController.text = widget.NombrenAnuncio;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Editar Anuncio")),
      body:Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[

            TextField(
              controller: descripcionController,

            ),

            TextField(
              controller: nombreController,
            ),
            TextField(
              controller: tiempoController,
            ),


            SizedBox(height: 32,),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final String nombre = nombreController.text;
          final String destutoria = descripcionController.text;
          final int destiempo = int.tryParse(tiempoController.text);
          await updatecurso(widget.IdCurso, nombre);
          await updatetutoria(widget.IdTuroria,widget.IdCurso, destutoria, destiempo);


          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MisAnuncios()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


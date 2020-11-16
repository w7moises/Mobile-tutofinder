import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'actualizarAnuncioView.dart';

class MisAnuncios extends StatefulWidget {
  @override
  _MisAnunciosState createState() => _MisAnunciosState();
}

class _MisAnunciosState extends State<MisAnuncios> {
  String url = 'https://tutofinder-movil.herokuapp.com/tutorias';
  List data;
  Dio dio = new Dio();

  Future<String> makeRequest() async{
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });
  }

  Future deletecurso(int aux) async {

    final String pathUrl = "https://tutofinder-movil.herokuapp.com/tutorias/"+aux.toString();
    var response = await dio.delete(pathUrl,data:data, options: Options(
        headers: {
          "Content-type": "application/json; charset=UTF-8",
        }
    ));
    print(response.data);
    return response.data;

  }



  @override
  void initState(){
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Mis Anuncios'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.chrome_reader_mode), onPressed: () {}
          )
        ],

      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Curso: ' + data[i]['curso']['nombre']),
              subtitle: Text('Tiempo: ' + data[i]['cantidadMinutos'].toString() + ' minutos'),
              trailing:  IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  var aux;
                  aux = int.tryParse(data[i]['id'].toString());
                  print(aux);
                  await deletecurso(aux);
                },
                color: Colors.black,
              ),
              leading: Icon(Icons.account_circle),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => actualizarAnuncio(data[i]['curso']['id'], data[i]['id'], data[i]['descripcionTutoria'],data[i]['curso']['nombre'],data[i]['cantidadMinutos'].toString())));
                print("Hola");
                print(data[i]['id']);
              },

            );
          }
      ),


    );
  }
}
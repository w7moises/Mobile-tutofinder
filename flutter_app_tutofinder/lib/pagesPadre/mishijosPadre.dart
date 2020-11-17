import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MisHijosPadre extends StatefulWidget {
  @override
  _MisHijosPadreState createState() => _MisHijosPadreState();
}

class _MisHijosPadreState extends State<MisHijosPadre> {
  String url = 'https://tutofinder-movil.herokuapp.com/alumnos';
  List data;

  Future<String> makeRequest() async{
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });
  }

  @override
  void initState(){
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Mis Hijos'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.chrome_reader_mode),
              onPressed: () {})
        ],
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Nombre: ' + data[i]['nombre'] + ' ' + data[i]['apellido']),
              subtitle: Text('Grado Académico: ' + data[i]['gradoEstudio']),
              leading: Icon(Icons.account_circle),
              onTap: (){

              },
            );
          }),
    );
  }
}

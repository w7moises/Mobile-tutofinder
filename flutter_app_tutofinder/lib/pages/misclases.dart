import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/pages/informes.dart';
import 'package:http/http.dart' as http;

import 'informes.dart';

class MisClases extends StatefulWidget {
  @override
  _MisClasesState createState() => _MisClasesState();
}

class _MisClasesState extends State<MisClases> {
  String url = 'https://tutofinder-movil.herokuapp.com/tutorias';
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
        title: Text('Mis Clases'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.chrome_reader_mode),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => Informes())
                );
              })
        ],
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Curso: ' + data[i]['curso']['nombre']),
              subtitle: Text('Docente: ' + data[i]['docente']['nombre']+ ' ' + data[i]['docente']['apellido']),
              trailing: Text(data[i]['cantidadMinutos'].toString() + 'minutos'),
              leading: Text(data[i]['id'].toString()),
              onTap: (){

              },
            );
          }),
    );
  }
}

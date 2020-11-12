import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Informes extends StatefulWidget {
  int id;
  Informes([this.id]);
  @override
  _InformesState createState() => _InformesState();
}

class _InformesState extends State<Informes> {
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
        title: Text('Mis Informes'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Descripcion del Informe: ' + data[i]['informe']['descripcionInforme']),
              leading: Text(data[i]['id'].toString()),
              onTap: (){
              },
            );
          }),
    );
  }
}

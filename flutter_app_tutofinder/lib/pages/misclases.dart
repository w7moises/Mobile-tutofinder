import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
              onPressed: () {})
        ],
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Curso: ' + data[i]['curso']['nombre']),
              subtitle: Text('Tiempo: ' + data[i]['cantidadMinutos'].toString() + ' minutos'),
              trailing: Icon(Icons.comment),
              leading: Icon(Icons.account_circle),
              onTap: (){

              },
            );
          }),
    );
  }
}

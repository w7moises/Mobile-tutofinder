import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MisClasesPadre extends StatefulWidget {
  @override
  _MisClasesPadreState createState() => _MisClasesPadreState();
}

class _MisClasesPadreState extends State<MisClasesPadre> {
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
              title: Text('Curso: ' + data[i]['informe']['descripcionInforme']),
              subtitle: Text('Tiempo: ' + data[i]['cantidadMinutos'].toString() + ' minutos'),
              trailing: IconButton(icon: Icon(Icons.comment), onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => Informe(value: data[i]['id']),)
                );
              }),
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

class Informe extends StatefulWidget {
  final int value;
  Informe({Key key,this.value}): super (key : key);

  @override
  _InformeState createState() => _InformeState();
}

class _InformeState extends State<Informe> {

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
    return MaterialApp(
      title: 'Ver informe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Informe de la tutoria'),
        ),
        body: Center(
          child: ListView.builder(
            padding: EdgeInsets.all(105.0),
              itemCount: data == null ? 0 : 1,
              itemBuilder: (BuildContext context, i){
                return ListTile(
                  leading: Text(data[widget.value-1]['informe']['descripcionInforme'].toString()),
                  onTap: (){
                  },
                );
              }),
        ),
      ),
    );
  }
}


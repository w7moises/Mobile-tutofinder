import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MisClases extends StatefulWidget {
  @override
  _MisClasesState createState() => _MisClasesState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _MisClasesState extends State<MisClases> {
  String url = 'https://tutofinder-movil.herokuapp.com/tutorias';
  final _debouncer = Debouncer(milliseconds: 500);
  List data;
  List filtro;

  Future<String> makeRequest() async{
    var response = await http.get(Uri.encodeFull(url));

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
      filtro = data;
    });
  }

  @override
  void initState(){
    super.initState();
    this.makeRequest().then((value){
      setState(() {
        data = json.decode(value);
        filtro = data;
      });
    });

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
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Filter by name or name'),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filtro = data
                      .where(
                          (u) => (u..toLowerCase().contains(string.toLowerCase()))).toList();
                });
              });

            },
          ),
          Expanded(
            child:ListView.builder(
                itemCount: filtro == null ? 0 : filtro.length,
                itemBuilder: (BuildContext context, i){
                  return ListTile(
                    title: Text('Curso: ' + filtro[i]['curso']['nombre']),
                    subtitle: Text('Tiempo: ' + filtro[i]['cantidadMinutos'].toString() + ' minutos'),
                    trailing: Icon(Icons.comment),
                    leading: Icon(Icons.account_circle),
                    onTap: (){

                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

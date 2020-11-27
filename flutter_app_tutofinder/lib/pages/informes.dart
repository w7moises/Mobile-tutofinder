import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/models/informe.dart';
import 'package:http/http.dart' as http;



class Informes extends StatefulWidget {
  @override
  _InformesState createState() => _InformesState();
}

class _InformesState extends State<Informes> {
  String url = 'https://tutofinder-movil.herokuapp.com/informes';
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
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => CrearInforme())
                );
              })
        ],
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Descripcion del Informe: ' + data[i]['descripcionInforme']),
              leading: Text(data[i]['id'].toString()),
              trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => EditarInforme(value: data[i]['id']),)
                );
              }),
              onTap: (){
              },
            );
          }),
    );
  }
}


Future<Informe> createInforme(String descripcion) async {
  final http.Response response = await http.post(
    'https://tutofinder-movil.herokuapp.com/informes',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'descripcionInforme': descripcion,
    }),
  );

  if (response.statusCode == 201) {
    return Informe.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create informe.');
  }
}

Future<Informe> editInforme(String descripcion,int id) async {
  final http.Response response = await http.put(
    'https://tutofinder-movil.herokuapp.com/informes/${id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'descripcionInforme': descripcion,
    }),
  );

  if (response.statusCode == 201) {
    return Informe.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create informe.');
  }
}


class CrearInforme extends StatefulWidget {
  @override
  _CrearInformeState createState() => _CrearInformeState();
}

class _CrearInformeState extends State<CrearInforme> {
  final TextEditingController _controller = TextEditingController();
  Future<Informe> _futureInforme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crear Informe'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureInforme == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Ingresar descripcion de la tutoria'),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: Text('Aceptar'),
                onPressed: () {
                  setState(() {
                    _futureInforme= createInforme(_controller.text);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Informes()));
                },
              ),
            ],
          )
              : FutureBuilder<Informe>(
            future: _futureInforme,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class EditarInforme extends StatefulWidget {
  final int value;

  EditarInforme({Key key,this.value}): super (key : key);

  @override
  _EditarInformeState createState() => _EditarInformeState();
}

class _EditarInformeState extends State<EditarInforme> {
  final TextEditingController _controller = TextEditingController();
  Future<Informe> _futureInforme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('${widget.value}'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureInforme == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Ingresar descripcion de la tutoria'),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                child: Text('Editar'),
                onPressed: () {
                  setState(() {
                    _futureInforme= editInforme(_controller.text,widget.value);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => Informes()));
                },
              ),
            ],
          )
              : FutureBuilder<Informe>(
            future: _futureInforme,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
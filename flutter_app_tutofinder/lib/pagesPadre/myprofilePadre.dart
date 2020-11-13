import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyProfilePadre extends StatefulWidget {
  @override
  _MyProfilePadreState createState() => _MyProfilePadreState();
}

class _MyProfilePadreState extends State<MyProfilePadre> {
  int score = 0;
  String url = 'https://tutofinder-movil.herokuapp.com/padres';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mi Perfil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            score += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        splashColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/padre.jpg'),
                radius: 90.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.red,
            ),
            Text(
                'NAME',
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Text(
                data[0]['nombre'] + ' ' + data[0]['apellido'],
                style: TextStyle(
                    color: Colors.amberAccent,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 10.0),
            Text(
                'DNI',
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Text(
                data[0]['dni'],
                style: TextStyle(
                    color: Colors.amberAccent,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 10.0),
            Text(
                'CURRENT SCORE',
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Text(
                '$score',
                style: TextStyle(
                    color: Colors.amberAccent,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: 10.0),
            Text(
                'CORREO',
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                SizedBox(width: 10.0),
                Text(
                    data[0]['correo'],
                    style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

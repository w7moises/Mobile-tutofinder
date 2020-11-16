import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class FormAnuncioClase extends StatefulWidget {
  @override
  _FormAnuncioClaseState createState() => _FormAnuncioClaseState();

}


class _FormAnuncioClaseState extends State<FormAnuncioClase> {

  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Crear Anuncio")),
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
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
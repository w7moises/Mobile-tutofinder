import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/pages/dashboard.dart';
import 'package:http/http.dart' as http;

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String url = 'https://tutofinder-movil.herokuapp.com/tarjetas';
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
        title: Text('Elegir método de pago'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i){
            return ListTile(
              title: Text('Número de Tarjeta: ' + data[i]['numeroTarjeta']),
                subtitle: Text('Fecha de expiración: ' + data[i]['fechaExpiracion'].toString()),
              trailing: Icon(Icons.credit_card),
              leading: Icon(Icons.account_balance),
              onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Elegir metodo de pago'),
                      content: Text('¿Seguro de comprar la membresía con la tarjeta seleccionada?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Si'),
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context)=>AlertDialog(
                                title: Text('Felicidades'),
                                content: Text('Su membresía fue comprada con éxito'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) => MyApp()
                                          ));
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyApp()
                              ));
                            },
                        )
                      ],
                    ),
                  );
              },
            );
          }),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/pages/anunciarclase.dart';
import 'package:flutter_app_tutofinder/pages/login.dart';
import 'package:flutter_app_tutofinder/pages/misanuncios.dart';
import 'package:flutter_app_tutofinder/pages/myprofile.dart';
import 'package:flutter_app_tutofinder/WebService.dart';
import 'package:flutter_app_tutofinder/pages/misclases.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("MENU TUTOFINDER"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Henrry Bustos Avila", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                  accountEmail: Text("henrrypaul_22@hotmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/docente.jpg'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ProfileCard()
                        ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: Text("Ubah Password"),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Ayuda"),
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Salir"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => LoginPage()
                        ));
                  },
                )
              ],
            )
        ),

        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(140.0, 40.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 68,
                          backgroundImage: AssetImage('assets/docente.jpg'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            GridView.count(
              padding: EdgeInsets.all(30.0),
              crossAxisCount: 2,
              children: <Widget>[
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => ProfileCard()
                          ));
                    },
                    splashColor: Colors.brown,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.account_circle, size: 70.0, color: Colors.brown),
                          Text("Mi Perfil", style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => FormAnuncioClase()
                          ));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.add_box_outlined, size: 70.0, color: Colors.blue),
                          Text("Anunciar Clases", style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => MisClases()
                          ));
                    },
                    splashColor: Colors.orange,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.school, size: 70.0, color: Colors.orange),
                          Text("Mis Clases", style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => MisAnuncios()
                          ));
                    },
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.account_balance, size: 70.0, color: Colors.blueGrey),
                          Text("Mis Anuncios", style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )


    );
  }
}


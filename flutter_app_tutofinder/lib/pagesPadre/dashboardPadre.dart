import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/pages/login.dart';
import 'package:flutter_app_tutofinder/pagesPadre/buscarclasePadre.dart';
import 'package:flutter_app_tutofinder/pagesPadre/misclasesPadre.dart';
import 'package:flutter_app_tutofinder/pagesPadre/mishijosPadre.dart';
import 'package:flutter_app_tutofinder/pagesPadre/myprofilePadre.dart';

class DashboardPadre extends StatefulWidget {
  @override
  _DashboardPadreState createState() => _DashboardPadreState();
}

class _DashboardPadreState extends State<DashboardPadre> {
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
                  accountName: Text("Katrin Maier", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                  accountEmail: Text("padre@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/padre.jpg'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => MyProfilePadre()
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
              padding: EdgeInsets.fromLTRB(120.0, 15.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('assets/padre.jpg'),
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
                          MaterialPageRoute(builder: (BuildContext context) => MyProfilePadre()
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
                          MaterialPageRoute(builder: (BuildContext context) => MisHijosPadre()
                          ));
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.admin_panel_settings_outlined, size: 70.0, color: Colors.blue),
                          Text("Mis Hijos", style: TextStyle(fontSize: 17.0))
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
                          MaterialPageRoute(builder: (BuildContext context) => MisClasesPadre()
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
                          MaterialPageRoute(builder: (BuildContext context) => BuscarClasesPadre()
                          ));
                    },
                    splashColor: Colors.blueGrey,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.account_balance, size: 70.0, color: Colors.blueGrey),
                          Text("Buscar Clases", style: TextStyle(fontSize: 17.0))
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


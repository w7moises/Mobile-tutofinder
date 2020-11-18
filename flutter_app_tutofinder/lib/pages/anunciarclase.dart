import 'package:flutter/material.dart';

class FormAnuncioClase extends StatefulWidget {
  @override
  _FormAnuncioClaseState createState() => _FormAnuncioClaseState();
}

class _FormAnuncioClaseState extends State<FormAnuncioClase> {
  String _nombreCurso;
  String _descripcion;
  String _tiempoMinutos;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCurso() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre de Curso'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }

        return null;
      },
      onSaved: (String value) {
        _nombreCurso = value;
      },
    );
  }

  Widget _buildDescripcion() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Descripción de la tutoría'),
      maxLength: 60,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Campo requerido';
        }

        return null;
      },
      onSaved: (String value) {
        _descripcion = value;
      },
    );
  }

  Widget _buildTiempo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Tiempo'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Tiempo no puede ser 0';
        }

        return null;
      },
      onSaved: (String value) {
        _tiempoMinutos = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(title: Text("Form Demo")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildCurso(),
              _buildDescripcion(),
              _buildTiempo(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(_nombreCurso);
                  print(_descripcion);
                  print(_tiempoMinutos);

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
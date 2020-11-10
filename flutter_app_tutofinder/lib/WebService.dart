import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_tutofinder/models/docente.dart';
import 'package:http/http.dart' as http;

class Webservice extends ChangeNotifier {

  List<Docente> docentes = List<Docente>();
  int value = 0;

  void toggleState() {
    this.value = 99;
    notifyListeners();
  }

  Future<void> loadDocentes() async {

    String url = "http://localhost:55939/docentes?page=1&take=2";
    final response = await http.get(url);

      final json = jsonDecode(response.body);
      final Iterable list = json["items"];
      this.docentes = list.map((item) => Docente.fromJSON(item)).toList();
      debugPrint("${this.docentes}");
      notifyListeners();

  }

}
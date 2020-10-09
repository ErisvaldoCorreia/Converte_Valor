import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:async/async.dart';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=58402027";

void main() async {
  http.Response response = await http.get(request);
  print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(MaterialApp(
    title: 'ConverteValor',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

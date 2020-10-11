import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=58402027";

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('CONVERSOR'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text('Carregando Dados...'),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro no carregamento :('),
                  );
                } else {
                  return Container(
                    color: Colors.green,
                  );
                }
            }
          },
        ));
  }
}

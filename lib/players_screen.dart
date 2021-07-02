import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'models/model.dart';

Future<BasketballPlayers> fetchBasketballPlayers() async {
  final response = await http
      .get(Uri.parse('https://www.balldontlie.io/api/v1/players'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return BasketballPlayers.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load!');
  }
}


  

void main() => runApp(MyApp());

class MyPlayers extends StatefulWidget {
  MyPlayers({Key? key}) : super(key: key);

  @override
  _MyPlayersState createState() => _MyPlayersState();
}

class _MyPlayersState extends State<MyPlayers> {
  late Future<BasketballPlayers> futureBasketballPlayers;

  @override
  void initState() {
    super.initState();
    futureBasketballPlayers = fetchBasketballPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('NBA Players'),
        ),
        body: Center(
          child: FutureBuilder<BasketballPlayers>(
            future: futureBasketballPlayers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      
    );
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    throw Exception('Failed to load album');
  }
}

class BasketballPlayers {
  final int playerId;
  final String firstname;
  final String lastname;
  final String position;
  final int heightfeet;
  final int heightinches;
  final int weightpounds;

  BasketballPlayers(
      {required this.playerId,
      required this.firstname,
      required this.lastname,
      required this.position,
      required this.heightfeet,
      required this.heightinches,
      required this.weightpounds});

  factory BasketballPlayers.fromJson(Map<String, dynamic> json) {
    return BasketballPlayers(
        playerId: json['id'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        position: json['position'],
        heightfeet: json['height_feet'],
        heightinches: json['height_inches'],
        weightpounds: json['weight_pounds']);
  }
}
  

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<BasketballPlayers> futureBasketballPlayers;

  @override
  void initState() {
    super.initState();
    futureBasketballPlayers = fetchBasketballPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<BasketballPlayers>(
            future: futureBasketballPlayers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.firstname);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

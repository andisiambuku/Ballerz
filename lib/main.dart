import 'package:ballerz/players_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ballerz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPlayers(),
    debugShowCheckedModeBanner: false,
    );
  }
}


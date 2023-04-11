import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Player {
  String? name;

  Player();
}

void main() {
  var nico = Player();
  print(nico.name);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 10,
          title: Text('Hello Flutter!'),
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Player {
  final String name;
  final int age;
  final int goalsScored;

  Player({required this.name, required this.age, required this.goalsScored});
}

class MyApp extends StatelessWidget {
  final List<Player> players = [
    Player(name: 'Cássio', age: 34, goalsScored: 0),
    Player(name: 'Fagner', age: 32, goalsScored: 4),
    Player(name: 'Gil', age: 34, goalsScored: 2),
    Player(name: 'João Victor', age: 23, goalsScored: 1),
    Player(name: 'Fábio Santos', age: 36, goalsScored: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corinthians Players',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Corinthians Players'),
        ),
        body: PlayerList(players: players),
      ),
    );
  }
}

class PlayerList extends StatelessWidget {
  final List<Player> players;

  PlayerList({required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(players[index].name),
          subtitle: Text('Age: ${players[index].age.toString()} | Goals: ${players[index].goalsScored.toString()}'),
        );
      },
    );
  }
}

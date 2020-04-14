import 'package:flutter/material.dart';

class ShowGame extends StatefulWidget {
  final String game;
  final List categories;
  final onReplaceGame;

  ShowGame({
    this.game,
    this.categories,
    this.onReplaceGame,
  });

  @override
  ShowGameState createState() => ShowGameState();
}

class ShowGameState extends State<ShowGame> {
  @override
  Widget build(BuildContext context) {
    var game = widget.game;
    return InkWell(
      child: Text(
          "$game",
        style: TextStyle(fontSize: 18, color: Colors.indigo[700]),
      ),
      onTap: () {
        widget.onReplaceGame(widget.categories);
      },
    );
  }
}

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
  String newGame;

  getCurrentGame(newGame) {
    if (newGame != null) {
      return newGame.toUpperCase();
    }
    return widget.game.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    var currentGame = getCurrentGame(this.newGame);
    return InkWell(
      child: Text(
          "$currentGame",
        style: TextStyle(fontSize: 18, color: Colors.indigo[700]),
      ),
      onTap: () {
        var newGame = widget.onReplaceGame(widget.categories);
        setState(() {this.newGame = newGame;});
      },
    );
  }
}

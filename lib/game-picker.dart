import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/games_by_category.dart' as games;
import 'package:improv_app/libraries/constants.dart' as constants;

class GamePicker extends StatefulWidget {
  @override
  GamePickerState createState() => GamePickerState();
}

class GamePickerState extends State<GamePicker> {
  String randomGame = 'Select a game category';

  _handleRandomGameButton(String category) {
    var gameList = [];
    if (category == 'any') {
      var values = games.byCategory.values.toList();
      // flatten values to be an un-nested list
      gameList = values.expand((game) => game).toList();
    } else {
      gameList = games.byCategory[category];
    }
    Random random = new Random();
    var index = random.nextInt(gameList.length);
    var game = gameList[index].toUpperCase();
    if (gameList.length > 1 && game == randomGame) {
      // don't pick the same game again
      return _handleRandomGameButton(category);
    }
    setState(() {
      randomGame = game;
    });
  }

  @override
  Widget build(BuildContext context) {
    var numInList = 6;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = kToolbarHeight;
    var resultHeight = 90;
    var paddingHeight = 10 * (numInList + 2);
    var adjustedHeight = height - appBarHeight - resultHeight - paddingHeight;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        Container(
          height: 90,
          padding: EdgeInsets.all(constants.BORDER_PADDING),
          child: Center(
            child: Text(
              "$randomGame",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.indigo[700]),
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: width / (adjustedHeight / numInList),
            mainAxisSpacing: 10,
            children: <Widget>[
              Material(
                color: Colors.orange[100],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('any');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Any type of game',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.orange[200],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('scene');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Scene game',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.orange[300],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('guessing');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Guessing game',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.orange[400],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('audience');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Audience participation',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.orange[500],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('musical');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Musical game',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.orange[600],
                shadowColor: Colors.grey[200],
                elevation: 3.0,
                child: InkWell(
                  splashColor: Colors.white30,
                  onTap: () {
                    this._handleRandomGameButton('standInALine');
                  },
                  child: Container(
                    padding: EdgeInsets.all(constants.BORDER_PADDING),
                    child: Center(
                      child: Text(
                        'Stand in a line',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

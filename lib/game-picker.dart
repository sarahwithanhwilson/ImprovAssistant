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
    setState(() {
      randomGame = gameList[index].toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    var numInList = 6;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = kToolbarHeight;
    var resultHeight = 90;
    var paddingHeight = 10 * (numInList + 1);
    var adjustedHeight = height - appBarHeight - resultHeight -  paddingHeight;
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
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('any');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Any type of game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('scene');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Scene game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('guessing');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Guessing game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('audience');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Audience participation',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('musical');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Musical game',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomGameButton('standInALine');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Stand in a line',
                      style: TextStyle(fontSize: 26),
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

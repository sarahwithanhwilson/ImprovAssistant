import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/games_by_category.dart' as games;
import 'package:improv_app/show-game.dart';
import 'package:improv_app/libraries/constants.dart' as constants;

class ShowGenerator extends StatefulWidget {
  @override
  ShowGeneratorState createState() => ShowGeneratorState();
}

class ShowGeneratorState extends State<ShowGenerator> {
  Map selectedGames = {};

  initializeSelectedGames(Map selectedGames) {
    if (selectedGames == null || selectedGames.isEmpty) {
      var selected = [];
      for (var i = 0; i < 12; i++) {
        var game = this.getRandomGameByType(constants.CATEGORIES_MAP[i]);
        selected.add(game);
      }
      setState(() {
        this.selectedGames = selected.asMap();
      });
    }
  }

  getRandomGameByType(List categories, [List options]) {
    // get a random game by type
    // pass in any number of categories (string[])
    if (categories.length == 0) return '';
    if (options == null) options = [];
    if (options.length == 1) return options[0];
    if (options.length == 0) {
      for (var i = 0; i < categories.length; i++) {
        var gameList = games.byCategory[categories[i]];
        if (games.byCategory[categories[i]] != null) {
          options = options + gameList;
        }
      }
    }
    Random random = new Random();
    var finalIndex = random.nextInt(options.length);
    var game = options[finalIndex];
    if (this.selectedGames != null && this.selectedGames.containsValue(game)) {
      // remove duplicate from index to prevent stack overflow and try again
      options.removeAt(finalIndex);
      return this.getRandomGameByType(categories, options);
    }
    return game;
  }

  @override
  Widget build(BuildContext context) {
    this.initializeSelectedGames(this.selectedGames);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Center(
          child: Column(
            children: <Text>[
              Text(
                "Your Improv Show",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.indigo[700]),
              ),
              Text(
                "Tap a game to replace it with a new one.",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(20),
            crossAxisCount: 1,
            childAspectRatio: 100 / 7,
            mainAxisSpacing: 8,
            children: <Widget>[
              ShowGame(
                  game: this.selectedGames[0],
                  categories: constants.CATEGORIES_MAP[0],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[1],
                  categories: constants.CATEGORIES_MAP[1],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[2],
                  categories: constants.CATEGORIES_MAP[2],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[3],
                  categories: constants.CATEGORIES_MAP[3],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[4],
                  categories: constants.CATEGORIES_MAP[4],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[5],
                  categories: constants.CATEGORIES_MAP[5],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[6],
                  categories: constants.CATEGORIES_MAP[6],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              Container(
                child: Center(
                  child: Text(
                    'Intermission',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                color: Colors.lime[200],
              ),
              ShowGame(
                  game: this.selectedGames[7],
                  categories: constants.CATEGORIES_MAP[7],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[8],
                  categories: constants.CATEGORIES_MAP[8],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[9],
                  categories: constants.CATEGORIES_MAP[9],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[10],
                  categories: constants.CATEGORIES_MAP[10],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
              ShowGame(
                  game: this.selectedGames[11],
                  categories: constants.CATEGORIES_MAP[11],
                  onReplaceGame: (List categories) {
                    return this.getRandomGameByType(categories);
                  }),
            ],
          ),
        ),
        Center(
          child: RaisedButton(
            child: Text("Get new show"),
            onPressed: () {
              this.initializeSelectedGames({});
            },
            color: Colors.lime[300],
            padding: EdgeInsets.all(10),
            splashColor: Colors.grey,
          ),
        ),
        Text(
            "This is a set of not-quite-randomly selected short form improv games. You can learn more about how the games are picked in the 'About' section of the menu."),
      ],
    );
  }
}

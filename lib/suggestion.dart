import 'dart:math';
import 'package:flutter/material.dart';
import 'package:improv_app/libraries/suggestions_by_category.dart' as suggestions;
import 'package:improv_app/libraries/constants.dart' as constants;

class Suggestion extends StatefulWidget {
  @override
  SuggestionState createState() => SuggestionState();
}

class SuggestionState extends State<Suggestion> {
  String randomSuggestion = 'Select a category';

  _handleRandomSuggestionButton(String category) {
    var suggestionList = [];
    if (category == 'any') {
      var values = suggestions.byCategory.values.toList();
      // flatten values to be an un-nested list
      suggestionList = values.expand((game) => game).toList();
    } else {
      suggestionList = suggestions.byCategory[category];
    }
    Random random = new Random();
    var index = random.nextInt(suggestionList.length);
    setState(() {
      randomSuggestion = suggestionList[index].toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    var numInList = 4;
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
              "$randomSuggestion",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.indigo[700]),
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
                  this._handleRandomSuggestionButton('any');
                },
                child: Container(
                  color: Colors.lime[100],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Any suggestion',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('locations');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Locations',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('people');
                },
                child: Container(
                  color: Colors.lime[200],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'People',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  this._handleRandomSuggestionButton('things');
                },
                child: Container(
                  color: Colors.lime[300],
                  padding: EdgeInsets.all(constants.BORDER_PADDING),
                  child: Center(
                    child: Text(
                      'Things',
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

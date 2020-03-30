import 'package:flutter/material.dart';
import 'package:improv_app/libraries/constants.dart' as constants;

class HomePage extends StatelessWidget {
  final Function setPage;

  HomePage({this.setPage});

  @override
  Widget build(BuildContext context) {
    var numInList = 3;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = kToolbarHeight;
    var paddingHeight = 10 * (numInList + 1);
    var adjustedHeight = height - appBarHeight - paddingHeight;
    var width = MediaQuery.of(context).size.width;

    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: width / (adjustedHeight / numInList),
      mainAxisSpacing: 10,
      children: <Widget>[
        Material(
          color: Colors.orange[200],
          shadowColor: Colors.grey[200],
          elevation: 3.0,
          child: InkWell(
            onTap: () {
              setPage(constants.SHOW_GENERATOR);
            },
            child: Container(
              padding: EdgeInsets.all(constants.BORDER_PADDING),
              child: Center(
                child: Text(
                  'Random Show Generator',
                  style: TextStyle(fontSize: 30),
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
            onTap: () {
              setPage(constants.GAMES);
            },
            splashColor: Colors.white30,
            child: Container(
              padding: EdgeInsets.all(constants.BORDER_PADDING),
              child: Center(
                child: Text(
                  'Pick a Game',
                  style: TextStyle(fontSize: 30),
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
            onTap: () {
              setPage(constants.SUGGESTIONS);
            },
            child: Container(
              padding: EdgeInsets.all(constants.BORDER_PADDING),
              child: Center(
                child: Text(
                  'Get Suggestions',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

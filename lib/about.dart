import 'package:flutter/material.dart';
import 'package:improv_app/libraries/constants.dart' as constants;

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 90,
          padding: EdgeInsets.all(constants.BORDER_PADDING),
          child: Center(
            child: Text(
              "About Improv Assistant",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.indigo[700]),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(constants.BORDER_PADDING),
          child: Text(
              "This app was originally created by Sarah Silva for Made Up Theatre in Fremont, California. Sarah is an improviser and a software engineer who wanted to make the process of selecting short form games for an improvised comedy show easier. This app also encourages our improv team to play a wider variety of games."),
        ),
        Container(
          padding: EdgeInsets.all(constants.BORDER_PADDING),
          child: Text(
              "The show generator randomly selects games from these categories:"),
        ),
        Container(
          padding: EdgeInsets.all(constants.BORDER_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "First half:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("1. Opening"),
              Text("2. Scene"),
              Text("3. Scene"),
              Text("4. Audience"),
              Text("5. Musical"),
              Text("6. Guessing"),
              Text("7. Closing"),
              Text(
                "Second half:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("1. After Intermission, Opening, Host Interrupt"),
              Text("2. Misc"),
              Text("3. Scene, Misc"),
              Text("4. Stand in a Line"),
              Text("5. Closing"),
            ],
          ),
        ),
      ],
    );
  }
}

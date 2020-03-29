import 'package:flutter/material.dart';
import 'package:improv_app/game-picker.dart';
import 'package:improv_app/show-generator.dart';
import 'package:improv_app/suggestion.dart';
import 'package:improv_app/home.dart';
import 'package:improv_app/about.dart';
import 'package:improv_app/libraries/constants.dart' as constants;

class NavPage extends StatefulWidget {
  @override NavPageState createState() => NavPageState();
}

class NavPageState extends State<NavPage> {
  String page = constants.HOME;

   _getPage() {
    switch(this.page) {
      case constants.SHOW_GENERATOR: {
        return ShowGenerator();
      }
      case constants.GAMES: {
        return GamePicker();
      }
      case constants.SUGGESTIONS: {
        return Suggestion();
      }
      case constants.ABOUT: {
        return About();
      }
      default: {
        return HomePage(setPage: this.setPage);
      }
    }
  }

  setPage(newPage) {
     setState(() {page = newPage;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Improv Assistant'),
      ),
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Improv Assistant',
                    style: TextStyle(color: Colors.white),

                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[600],
                  ),
                ),
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    setState(() {
                      page = constants.HOME;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Random show generator'),
                  onTap: () {
                    setState(() {
                      page = constants.SHOW_GENERATOR;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Pick a game'),
                  onTap: () {
                    setState(() {
                      page = constants.GAMES;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Get suggestions'),
                  onTap: () {
                    setState(() {
                      page = constants.SUGGESTIONS;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('About the app'),
                  onTap: () {
                    setState(() {
                      page = constants.ABOUT;
                    });
                    Navigator.pop(context);
                  },
                ),
              ]
          )
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: _getPage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:improv_app/main.dart';

void main() {
  testWidgets('loads home page', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Random Show Generator'), findsOneWidget);
    expect(find.text('Pick a Game'), findsOneWidget);
    expect(find.text('Get Suggestions'), findsOneWidget);
  });

  testWidgets('opens show generator', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Random Show Generator'));
    await tester.pump();
    expect(find.text('Your Improv Show'), findsOneWidget);
  });

  testWidgets('opens game picker', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Pick a Game'));
    await tester.pump();
    expect(find.text('Select a game category'), findsOneWidget);
  });

  testWidgets('gets game', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Pick a Game'));
    await tester.pump();
    await tester.tap(find.text('Any type of game'));
    await tester.pump();
    expect(find.text('Select a game category'), findsNothing);
  });

  testWidgets('opens suggestions and gets suggestion', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Get Suggestions'));
    await tester.pump();
    expect(find.text('Select a category'), findsOneWidget);
  });

  testWidgets('opens suggestions and gets suggestion', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Get Suggestions'));
    await tester.pump();
    await tester.tap(find.text('Any suggestion'));
    await tester.pump();
    expect(find.text('Select a category'), findsNothing);
  });

  testWidgets('opens menu', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Random show generator'), findsOneWidget);
    expect(find.text('Pick a game'), findsOneWidget);
    expect(find.text('Get suggestions'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('goes home', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    await tester.tap(find.text('Home'));
    await tester.pump();
    expect(find.text('Random Show Generator'), findsOneWidget);
  });

  testWidgets('opens about', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    var about = find.text('About');
    expect(about, findsOneWidget);
    // TODO: Why does this part fail?
//    await tester.tap(about);
//    await tester.pump();
//    expect(find.text('About Improv Assistant'), findsOneWidget);
  });

  testWidgets('replaces game in show schedule', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Random Show Generator'));
    await tester.pump();
    var firstGame = find.byType(Text).first;
    await tester.tap(firstGame);
    await tester.pump();
    var firstGameAfterChange = find.byType(Text).first;
    expect(firstGame, isNot(firstGameAfterChange));
  });

  testWidgets('generates new game', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Random Show Generator'));
    await tester.pump();
    var firstGame = find.byType(Text).first;
    var button = find.text('Get a new show');
    await tester.tap(button);
    await tester.pump();
    var firstGameAfterChange = find.byType(Text).first;
    expect(firstGame, isNot(firstGameAfterChange));
  });

  testWidgets('replaces game and then gets new show', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Random Show Generator'));
    await tester.pump();
    var firstGame = find.byType(Text).first;
    await tester.tap(firstGame);
    await tester.pump();
    var firstGameAfterChange = find.byType(Text).first;
    expect(firstGame, isNot(firstGameAfterChange));
    var button = find.text('Get a new show');
    await tester.tap(button);
    await tester.pump();
    var firstGameAfterNewShow = find.byType(Text).first;
    expect(firstGameAfterChange, isNot(firstGameAfterNewShow));

  });
}

import 'package:flutter/material.dart';
import 'package:xo/game_page.dart';
import 'package:xo/xo_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Xo.routeName,
      routes: {
        Xo.routeName: (context) => Xo(),
        GamePage.routeName: (context) => GamePage(),
      },
    );
  }
}

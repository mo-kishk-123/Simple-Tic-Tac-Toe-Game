import 'package:flutter/material.dart';
import 'package:xo/player_model.dart';

import 'game_page.dart';

class Xo extends StatelessWidget {
  static const String routeName = "xo";

  Xo({super.key});

  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XO Game", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Welcome in My Small Game",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: player1,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                suffixIcon: Icon(Icons.edit, size: 30),
                labelText: ("Player One"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: player2,
              style: TextStyle(
                fontSize: 20,
              ),
              cursorColor: Colors.cyan,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                suffixIcon: Icon(Icons.edit, size: 30),
                labelText: ("Player Two"),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(GamePage.routeName,
                      arguments: PlayersModel(player1.text, player2.text));
                },
                child: Text(
                  "Go To Game",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }
}

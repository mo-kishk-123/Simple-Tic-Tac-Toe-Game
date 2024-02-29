import 'package:flutter/material.dart';
import 'package:xo/board_Button.dart';
import 'package:xo/player_model.dart';

class GamePage extends StatefulWidget {
  static const String routeName = "Game Page";

  GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score1 = 0;
  int score2 = 0;
  int counter = 1;
  List<String> boardState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    PlayersModel model =
        ModalRoute.of(context)!.settings.arguments as PlayersModel;
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
                height: 40,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome in My Small Game",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(model.player1Name, style: TextStyle(fontSize: 30)),
                        Text("$score1", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(model.player2Name, style: TextStyle(fontSize: 30)),
                        Text("$score2", style: TextStyle(fontSize: 30))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    lable: boardState[0], index: 0, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[1], index: 1, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[2], index: 2, onClick: onBoardBtnClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    lable: boardState[3], index: 3, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[4], index: 4, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[5], index: 5, onClick: onBoardBtnClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    lable: boardState[6], index: 6, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[7], index: 7, onClick: onBoardBtnClick),
                BoardButton(
                    lable: boardState[8], index: 8, onClick: onBoardBtnClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onBoardBtnClick(index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      boardState[index] = "X";
      bool win = checkWin("X");
      if (win) {
        score1 += 10;
        resetBoard();
      }
    } else {
      boardState[index] = "O";
      bool win = checkWin("O");
      if (win) {
        score2 += 10;
        resetBoard();
      }
    }
    if(counter==9){
      resetBoard();
    }
    counter++;
    setState(() {});
  }

  resetBoard() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  bool checkWin(String symobl) {
    // Rows

    for (int i = 0; i < 9; i += 3) {
      if (symobl == boardState[i] &&
          symobl == boardState[i + 1] &&
          symobl == boardState[i + 2]) {
        return true;
      }
    }

    //Columns

    for (int i = 0; i < 3; i++) {
      if (symobl == boardState[i] &&
          symobl == boardState[i + 3] &&
          symobl == boardState[i + 6]) {
        return true;
      }
    }

    //Diagonals

    if (symobl == boardState[0] &&
        symobl == boardState[4] &&
        symobl == boardState[8]) {
      return true;
    }
    if (symobl == boardState[2] &&
        symobl == boardState[4] &&
        symobl == boardState[6]) {
      return true;
    }

    return false;
  }
}

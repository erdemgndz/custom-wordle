import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lingo/models/stats.dart';
import 'package:lingo/screens/close_page.dart';
import '../alerts/lose_dialog.dart';
import '../alerts/win_dialog.dart';
import '../widgets/game_board.dart';
import '../widgets/game_keyboard.dart';
import '../models/letter.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  final int wordLength;

  const GamePage({Key? key, required this.wordLength}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<List<Letter>> wordleBoard;
  late String gameGuess;
  int currentRow = 0;
  int currentLetter = 0;
  List<String> fourWordList = ["ağaç", "ağız", "akıl", "bina", "biri", "daha", "doğa", "dost", "eski", "gece"];
  List<String> fiveWordList = ["akşam", "bahçe", "balık", "beyaz", "bitki", "burun", "deniz", "güneş", "kadın", "kitap", "çocuk", "insan", "şehir"];
  List<String> sixWordList = ["adalet","bardak","kibrit","enerji","sohbet","tavşan","yengeç"];

  bool gameOver = false;
  late Future<GameStats> futureStats;
  late GameStats stats;

  @override
  void initState() {
    super.initState();
    _initGame();
    futureStats = _loadStats(); // Load stats asynchronously
  }

  void _initGame() {
    wordleBoard = List.generate(
      6, // Fixed number of guesses/rows
          (index) => List.generate(widget.wordLength, (index) => Letter("", 0,false)),
    );

    final random = Random();

    switch(widget.wordLength){
      case 4:
        int index = random.nextInt(fourWordList.length);
        gameGuess = customUpperCase(fourWordList[index]);
      case 5:
        int index = random.nextInt(fiveWordList.length);
        gameGuess = customUpperCase(fiveWordList[index]);
      case 6:
        int index = random.nextInt(sixWordList.length);
        gameGuess = customUpperCase(sixWordList[index]);
    }


    // Debug print
    print('New game initialized with guess: $gameGuess');
  }

  Future<GameStats> _loadStats() async {
    return await GameStats.loadStats(); // Load and return stats
  }

  void _insertLetter(String letter) {
    if (currentLetter < widget.wordLength) {
      setState(() {
        wordleBoard[currentRow][currentLetter] = Letter(letter, 0,false);
        currentLetter++;
      });
    }
  }

  String customUpperCase(String input) {
    return input
        .replaceAll('i', 'İ')
        .replaceAll('ı', 'I')
        .replaceAll('ğ', 'Ğ')
        .replaceAll('ü', 'Ü')
        .replaceAll('ş', 'Ş')
        .replaceAll('ö', 'Ö')
        .replaceAll('ç', 'Ç')
        .toUpperCase();
  }


  void _checkGuess() {
    if (currentLetter == widget.wordLength) {
      String guess = wordleBoard[currentRow].map((e) => e.letter).join();
      if (guess == gameGuess) {
        setState(() {
          for (int i = 0; i < widget.wordLength; i++) {
            wordleBoard[currentRow][i].code = 1; // Correct position
          }
          gameOver = true;
          stats.updateStats(true);
          _showWinDialog();
        });
      } else {
        String copyGameGuess = gameGuess;

        setState(() {
          for (int i = 0; i < widget.wordLength; i++) {
            if (gameGuess[i] == guess[i]) {
              copyGameGuess = copyGameGuess.replaceFirst(guess[i], "-");
              wordleBoard[currentRow][i].code = 1; // Correct position
            }
          }
          for (int i = 0; i < widget.wordLength; i++) {
            if(wordleBoard[currentRow][i].code!=1){
              if (copyGameGuess.contains(guess[i])) {
              copyGameGuess = copyGameGuess.replaceFirst(guess[i], "-");
              wordleBoard[currentRow][i].code = 2; // Correct letter, wrong position
            }
            else {
              wordleBoard[currentRow][i].code = 3; // Incorrect letter
            }}

          }
          if (currentRow < 5) {
            currentRow++;
            currentLetter = 0;
          } else {
            gameOver = true;
            stats.updateStats(false);
            _showLoseDialog();
          }
        });
      }
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WinDialog(
          points: 30,
          stats: stats,
          onContinue: () {
            Navigator.of(context).pop(); // Close the dialog
            _resetGame(); // Reset the game
          },
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      _initGame(); // Reinitialize the game
      futureStats = _loadStats(); // Reload stats
      gameOver = false; // Ensure gameOver is reset
      currentRow = 0;
      currentLetter = 0;

      // Debug print
      print('Game reset');
    });
  }

  void _showLoseDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoseDialog(
          stats: stats, // Pass the current stats object
          onRestart: () {
            Navigator.of(context).pop(); // Close the dialog
            _resetGame(); // Reset the game
          },
        );
      },
    );
  }


  void _deleteLetter() {
    if (currentLetter > 0) {
      setState(() {
        currentLetter--;
        wordleBoard[currentRow][currentLetter] = Letter("", 0,false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String backgroundImage = 'assets/${widget.wordLength}_letter_background.png';
    String headerText = '${widget.wordLength} Harf';

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: FutureBuilder<GameStats>(
          future: futureStats,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available'));
            } else {
              stats = snapshot.data!;
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClosePage(wordLength: widget.wordLength),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.close_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          headerText,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 42,
                        child: GameBoard(wordleBoard: wordleBoard),
                      ),
                      Expanded(
                        flex: 24,
                        child: GameKeyboard(
                          onKeyPressed: _insertLetter,
                          onEnterPressed: _checkGuess,
                          onDeletePressed: _deleteLetter,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'letter_tile.dart';
import '../models/letter.dart';

class GameBoard extends StatelessWidget {
  final List<List<Letter>> wordleBoard;

  const GameBoard({Key? key, required this.wordleBoard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align rows to the top
        children: wordleBoard
            .map((row) => Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center tiles horizontally
          children: row.map((letter) => LetterTile(letter: letter)).toList(),
        ))
            .toList(),
      ),
    );
  }
}

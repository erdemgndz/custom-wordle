import 'package:flutter/material.dart';
import 'package:lingo/models/letter.dart';

class LetterTile extends StatelessWidget {
  final Letter letter;

  const LetterTile({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.14,
      height: MediaQuery.of(context).size.width*0.14,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
        color: _getBackgroundColor(),
      ),
      child: Center(
        child: Text(
          letter.letter,
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: letter.checked ? Colors.white : Colors.black ,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (letter.code) {
      case 1:
        letter.checked = true;
        return const Color(0xFF10B910);
      case 2:
        letter.checked = true;
        return const Color(0xFFFE7920);
      case 3:
        letter.checked = true;
        return const Color(0x99000000);
      default:
        return Colors.white;
    }
  }
}

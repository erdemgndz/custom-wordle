import 'package:flutter/material.dart';
import 'package:lingo/models/letter.dart';

class FakeLetterTile extends StatelessWidget {
  final String letter;
  final Color  bgColor;
  final int tileSize;
  const FakeLetterTile({Key? key, required this.letter,required this.bgColor,required this.tileSize,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*tileSize/100,
      height: MediaQuery.of(context).size.width*tileSize/100,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


}

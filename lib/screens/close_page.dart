import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/alerts/close_alert.dart';
import 'package:lingo/widgets/fake_letter_tile.dart';
import 'package:lingo/widgets/letter_tile.dart';

class ClosePage extends StatelessWidget {
  final int wordLength;
  const ClosePage({super.key, required this.wordLength});

  @override
  Widget build(BuildContext context) {
    String backgroundImage = 'assets/${wordLength}_letter_background.png';

    // Display the CloseAlert dialog when this page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dialog from closing on outside touch
        builder: (BuildContext context) {
          return CloseAlert(wordLength: wordLength);
        },
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

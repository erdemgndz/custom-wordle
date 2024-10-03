import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/stats.dart';

class LoseDialog extends StatelessWidget {
  final GameStats stats;
  final VoidCallback onRestart;

  const LoseDialog({Key? key, required this.stats, required this.onRestart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double fontSizeMultiplier = (screenSize.height/1000);

    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: const Color(0xFF393939),
        child: Container(
          width: screenSize.width * 0.75,
          height: screenSize.height * 0.4,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white, // Border color
              width: 1.5, // Border width
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: Text(
                  "HAKKIN BİTTİ!",
                  style: GoogleFonts.metrophobic(
                    textStyle:  TextStyle(fontSize: 24*fontSizeMultiplier),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Colors.black,
                thickness: 2,
                indent: 40,
                endIndent: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatBox("Toplam\n Oynama", stats.totalGames,screenSize),
                    _buildStatBox("Son \nArt Arda", stats.currentStreak,screenSize),
                    _buildStatBox("En Çok\n Art Arda", stats.maxStreak,screenSize),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onRestart, // Trigger the reset function when tapped
                child: Container(
                  width: screenSize.width*0.5,
                  height: screenSize.height*0.065,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Yeniden Başla",
                      style: GoogleFonts.metrophobic(
                        textStyle:  TextStyle(fontSize: 24*fontSizeMultiplier),
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, int value,Size screenSize) {
    return Column(
      children: [
        Container(
          height: screenSize.height*0.038,
          width: screenSize.width*0.134,
          child: FittedBox(
            child: Text(
              label,
              style: GoogleFonts.metrophobic(
                textStyle: const TextStyle(fontSize: 15),
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: screenSize.width*0.134,
          height: screenSize.height*0.046,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                "$value", // Display the stat value
                style: GoogleFonts.metrophobic(
                  textStyle: const TextStyle(fontSize: 18),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

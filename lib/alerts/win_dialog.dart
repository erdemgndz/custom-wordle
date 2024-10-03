import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/stats.dart';

class WinDialog extends StatelessWidget {
  final int points;
  final GameStats stats;
  final VoidCallback onContinue;

  const WinDialog({
    super.key,
    required this.points,
    required this.stats,
    required this.onContinue,
  });

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
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Wrap the Text and Icon in FittedBox to make them responsive
                    FittedBox(
                      child: Row(
                        children: [
                          Text(
                            "$points", // Dynamic points value
                            style: GoogleFonts.metrophobic(
                              textStyle:  TextStyle(fontSize: 36*fontSizeMultiplier),
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.star_rounded, size: 37, color: Colors.yellow),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Text(
                  "TEBRİKLER!",
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
                padding: const EdgeInsets.only(bottom: 25),
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
                onTap: onContinue,
                child: Container(
                  width: screenSize.width*0.5,
                  height: screenSize.height*0.065,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        "Devam Et",
                        style: GoogleFonts.metrophobic(
                          textStyle:  TextStyle(fontSize: 24*fontSizeMultiplier),
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
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


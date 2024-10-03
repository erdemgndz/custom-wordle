import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/stats.dart'; // Import your stats model

class StatsPage extends StatelessWidget {
  final GameStats stats; // Add a parameter to receive stats

  const StatsPage({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int successRate = stats.totalGames != 0 ? (stats.totalScore/(stats.totalGames*0.3)).toInt() : 0;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              "assets/home_page_background.png",
              fit: BoxFit.cover, // Cover the whole screen
            ),
          ),
          // Foreground content
          Column(
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back
                      },
                    ),
                  ],
                ),
              ),
              // Title with star icons
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star_rounded, size: 37, color: Colors.yellow),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Puan Tablosu",
                        style: GoogleFonts.metrophobic(
                          textStyle: const TextStyle(fontSize: 32),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(Icons.star_rounded, size: 37, color: Colors.yellow),
                  ],
                ),
              ),
              // Statistics container
              Container(
                width: screenSize.width * 0.7,
                height: screenSize.height * 0.35,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.5),
                  border: Border.all(
                    color: Colors.yellow, // Border color
                    width: 1.5, // Border width
                  ),
                ),
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.fromLTRB(0,screenSize.height*0.08, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenSize.height*0.04,
                            child: FittedBox(
                              child: Text(
                                stats.totalScore.toString(),
                                style: GoogleFonts.metrophobic(
                                  textStyle: const TextStyle(fontSize: 30),
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const Icon(Icons.star_rounded, size: 30, color: Colors.yellow),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatBox("Toplam\n Oynama", stats.totalGames,screenSize),
                        _buildStatBox("Başarı\n Oranı",successRate,screenSize),
                        _buildStatBox("Son Art\n Arda", stats.currentStreak,screenSize),
                        _buildStatBox("En Çok\n Art Arda", stats.maxStreak,screenSize),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build individual statistic boxes
  Widget _buildStatBox(String label, int value,Size screenSize) {
    return Column(
      children: [
        SizedBox(
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
            child: Text(
              label == "Başarı\n Oranı" ? "$value%" : "$value", // Display the stat value
              style: GoogleFonts.metrophobic(
                textStyle: const TextStyle(fontSize: 18),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

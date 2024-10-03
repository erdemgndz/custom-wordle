import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/widgets/fake_letter_tile.dart';
import 'package:lingo/widgets/letter_tile.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double fontSizeMultiplier = (screenSize.height/1000);
    Color blackTile = const Color(0x99000000);
    Color orangeTile = const Color(0xFFFE7920);
    Color greenTile = const Color(0xFF10B910);
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0,left: 30), // Adjust top padding to avoid status bar overlap
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
              Container(
                height: screenSize.height*0.15,
                child: Center(
                  child: Text(
                    "Nasıl Oynanır?",
                    style: GoogleFonts.metrophobic(
                      textStyle:  TextStyle(fontSize: 32*fontSizeMultiplier),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.6,
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Container(
                        height: screenSize.height*0.1,
                        child: AutoSizeText(
                          "Doğru kelimeye ulaşmak için 6 hakkın var. Denemelerinden harflerin ve yerlerinin doğru olup olmadığını öğrenebilirsin.",
                          minFontSize: 10,
                          maxFontSize: 50,
                          stepGranularity: 0.5,
                          style: GoogleFonts.metrophobic(
                            textStyle: TextStyle(fontSize: 20),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                     Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "O", bgColor: blackTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "K", bgColor: orangeTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "U", bgColor: orangeTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "L", bgColor: blackTile, tileSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Container(
                        height: screenSize.height*0.095,
                        child: AutoSizeText(
                          "  O ve L harfleri doğru kelimede yer almıyor.\n K ve U harfleri ise doğru kelimede yer alıyor fakat yerleri doğru değil.",
                          minFontSize: 10,
                          maxFontSize: 50,
                          stepGranularity: 0.5,
                          style: GoogleFonts.metrophobic(
                            textStyle:  TextStyle(fontSize: 18),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                     Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "K", bgColor: greenTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "A", bgColor: blackTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "R", bgColor: greenTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "T", bgColor: greenTile, tileSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Container(
                        height: screenSize.height*0.065,
                        child: AutoSizeText(
                          "  K, R, T harfleri ve yerleri doğru. A harfi ise doğru kelimede yer almıyor.",
                          minFontSize: 10,
                          maxFontSize: 50,
                          stepGranularity: 0.5,
                          style: GoogleFonts.metrophobic(
                            textStyle:  TextStyle(fontSize: 18),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "K", bgColor: greenTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "U", bgColor: greenTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "R", bgColor: greenTile, tileSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FakeLetterTile(letter: "T", bgColor: greenTile, tileSize: 14),
                          ),
                        ],
                      ),
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
}

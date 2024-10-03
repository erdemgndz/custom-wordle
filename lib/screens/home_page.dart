import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo/screens/stats_page.dart';
import 'game_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'help_page.dart';
import '../models/stats.dart'; // Import your stats model

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int wordLength = 5;
  String backgroundImage = 'assets/home_page_background.png';
  late GameStats stats; // Add a field for statistics

  @override
  void initState() {
    super.initState();
    _loadStats(); // Load stats when the page initializes
  }

  Future<void> _loadStats() async {
    stats = await GameStats.loadStats();
    setState(() {}); // Trigger a rebuild if needed
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover, // Cover the whole screen
            ),
          ),
          Column(
            children: [
              Container(
                height: screenSize.height*0.16, // Set the desired height
                child: SafeArea( // Ensures content is not under the status bar
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Center(
                            child: IconButton(
                              icon: Icon(Icons.star_rounded, size: screenSize.height*0.04, color: Colors.yellow,),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StatsPage(stats: stats), // Pass stats here
                                  ),
                                );
                              },
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Center(
                            child: IconButton(
                              icon: SvgPicture.asset("assets/help_icon.svg", width: screenSize.height*0.04, height: screenSize.height*0.04,),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HelpPage(),
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenSize.height*0.04,),
              Center(
                child: Image.asset("assets/wordle_logo.png"),
              ),
              SizedBox(height: screenSize.height*0.13),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedPadding(
                      padding: EdgeInsets.only(top: wordLength == 4 ? 0 : 25),
                      duration: const Duration(milliseconds: 200),
                      child: IconButton(
                        icon: SvgPicture.asset("assets/4_icon.svg", width: 74, height: 90),
                        onPressed: () {
                          setState(() {
                            wordLength = 4;
                          });
                        },
                      ),
                    ),
                    AnimatedPadding(
                      padding: EdgeInsets.only(top: wordLength == 5 ? 0 : 25),
                      duration: const Duration(milliseconds: 200),
                      child: IconButton(
                        icon: SvgPicture.asset("assets/5_icon.svg", width: 74, height: 90),
                        onPressed: () {
                          setState(() {
                            wordLength = 5;
                          });
                        },
                      ),
                    ),
                    AnimatedPadding(
                      padding: EdgeInsets.only(top: wordLength == 6 ? 0 : 25),
                      duration: const Duration(milliseconds: 200),
                      child: IconButton(
                        icon: SvgPicture.asset("assets/6_icon.svg", width: 74, height: 90),
                        onPressed: () {
                          setState(() {
                            wordLength = 6;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height*0.08,),
              InkWell(
                onTap: () => _startGame(context, wordLength),
                child: Container(
                  height: screenSize.height*0.07,
                  width: screenSize.width*0.76,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all( // Border color
                      width: 1.5, // Border width
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Oyuna Başla",
                      style: GoogleFonts.metrophobic(
                        textStyle: TextStyle(fontSize: 36/1000*screenSize.height),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _startGame(BuildContext context, int wordLength) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(wordLength: wordLength),
      ),
    );
  }
}

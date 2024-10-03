import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CloseAlert extends StatelessWidget {
  final int wordLength;
  const CloseAlert({super.key, required this.wordLength});


  @override
  Widget build(BuildContext context) {
    int borderColor = 0xFFFFFFFF;
    int buttonColor = 0xFFFFFFFF;
    switch(wordLength){
      case 4:
        buttonColor=0xFFFE7920;
        borderColor=0x80FE7920;
      case 5:
        buttonColor=0xFF3269DF;
        borderColor=0x803269DF;
      case 6:
        buttonColor=0xFF10B910;
        borderColor=0x8010B910;
    }



    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        backgroundColor: Colors.transparent, // Make the background transparent to show the border
        child: Container(
          width: MediaQuery.of(context).size.width*0.8,
          height:MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), // Dialog background color
            borderRadius: BorderRadius.circular(10.0), // Match border radius with Dialog shape
            border: Border.all(
              color: Color(borderColor), // Border color
              width: 3.0, // Border width
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Oyundan çıkmak istediğine emin misin?",
                  style: GoogleFonts.metrophobic(
                    textStyle: const TextStyle(fontSize: 24),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.6), // Dark color for the "EVET" button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Rounded button
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
      // Navigate back
                      },
                      child: Text(
                        "EVET",
                        style: GoogleFonts.metrophobic(
                          textStyle: const TextStyle(fontSize: 24),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(buttonColor), //
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Rounded button
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        // Close dialog
                      },
                      child: Text(
                        "HAYIR",
                        style: GoogleFonts.metrophobic(
                          textStyle: const TextStyle(fontSize: 24),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});
  final Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240,
            child: Text(
              'Discover Your Personality Type!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(height: 30),
          Text('💖 🗺️', style: TextStyle(fontSize: 60)),
          Text('📆 🧠', style: TextStyle(fontSize: 60)),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: switchScreen,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            child: Text(
              'Start Test',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(37, 37, 37, 1),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Color.fromRGBO(37, 37, 37, 1),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(),
      ),
      home: HomePage(),
    );
  }
}

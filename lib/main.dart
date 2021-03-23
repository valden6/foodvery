import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodvery/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(InstagramApp());
}

class InstagramApp extends StatefulWidget {
  @override
  _InstagramAppState createState() => _InstagramAppState();
}

class _InstagramAppState extends State<InstagramApp> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme)
      ),
      home: HomeScreen()
    );
  }
}
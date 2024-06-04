import 'package:blog_stream/Screens/BlogListScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'Screens/BlogDetailScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Color(0xFF3A3A3A),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF3A3A3A),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 1.2,
            wordSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: BlogListScreen(),
    );
  }
}



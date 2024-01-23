import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 0, 75),
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'AgeoTrial',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

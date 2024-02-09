import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(0, 10), // Adjust the Y offset as needed
          child: const Text(
            "Sales",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 52, 34, 56),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 52, 34, 56),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Item 1",
              style: TextStyle(color: Colors.white),
            ),
            // Add more ListTile widgets or customize as needed
          ),
          ListTile(
            title: Text(
              "Item 2",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // Add more ListTiles or other widgets as needed
        ],
      ),
    );
  }
}

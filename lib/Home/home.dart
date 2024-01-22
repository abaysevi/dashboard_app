// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String welcomeText = "Home";

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response =
//         await http.get(Uri.parse('https://your-api-endpoint.com/welcome'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         welcomeText = data['text'];
//       });
//     } else {
//       // Handle errors
//       print('Failed to load data. Error: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 64, 0, 75),
//       body: Center(
//         child: Text(
//           welcomeText,
//           style: const TextStyle(
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'AgeoTrial',
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

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

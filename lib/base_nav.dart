// import 'package:flutter/material.dart';
// import './Home/home.dart';
// import './Profile/profile.dart';
// import './Report/report.dart';
// import './Sales/sales.dart';

// class BasePage extends StatefulWidget {
//   const BasePage({super.key});

//   @override
//   State<BasePage> createState() => _BasePageState();
// }

// class _BasePageState extends State<BasePage> {
//   final _pageOptions = [
//     HomePage(),
//     SalesPage(),
//     ReportPage(),
//     ProfilePage(),
//   ];
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pageOptions[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Sales',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: 'Report',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_rounded),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 64, 0, 75),
//         unselectedItemColor: Colors.grey,
//         onTap: (index) => setState(() => _selectedIndex = index),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import './Home/home.dart';
import './Profile/profile.dart';
import './Report/report.dart';
import './Sales/sales.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final _pageOptions = [
    HomePage(),
    SalesPage(),
    ReportPage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;

    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            isDark ? Colors.white : Color.fromARGB(255, 64, 0, 75),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

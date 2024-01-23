import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart'; // Adjust the import based on your project structure

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId'); // Clear the 'userId' data

    // Navigate to the login page and remove all routes on top of it
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // corrected function name
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 0, 75),
      body: Stack(
        children: [
          const Center(
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'AgeoTrial',
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 2,
                color: Colors.white,
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onTap: _logout,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

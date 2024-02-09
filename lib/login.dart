import 'package:flutter/material.dart';
import './base_nav.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future storeData(String userId) async {
    print("-------------------yo--------------------");
    print(userId);
    print("-------------------yo--------------------");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
  }

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  // void check_if_already_login() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool userStatus = prefs.containsKey('userId');
  //   if (userStatus == true) {
  //     print(userStatus);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const BasePage()));
  //   }
  // }
  void check_if_already_login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userStatus = prefs.containsKey('userId');

    if (userStatus) {
      String userId = prefs.getString('userId') ?? 'UserId is null or empty';
      print('UserId: $userId');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BasePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 0, 75),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "odoo",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),

            // Reduced width textbox
            SizedBox(
              width: 360.0, // Adjust this width as needed
              child: TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Reduced width textbox
            SizedBox(
              width: 360.0, // Adjust this width as needed
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Reduced width button using Container
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity,
                      50), // Sets full width, adjust according to layout
                ),
                child: const Text('Login'),
                onPressed: () {
                  loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://172.18.109.2:8069/web/session/authenticate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "jsonrpc": "2.0",
          "params": {"db": "test", "login": email, "password": password}
        }),
      );

      if (response.statusCode == 200) {
        print("Recived Response");
        // print(response.body);

        // Parse the response JSON
        final responseData = json.decode(response.body);

        if (responseData.containsKey("result") &&
            responseData["result"] != null) {
          final resultData = responseData["result"];

          if (resultData.containsKey("uid") && resultData["uid"] != null) {
            final String userId = resultData["uid"].toString();
            storeData(userId);

            // Navigate to the next page (BasePage)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BasePage()),
            );
            return; // Exit the function to prevent further execution
          }
        } else if (responseData.containsKey("error") &&
            responseData["error"] != null) {
          // Handle the case where the server returns an error
          final errorData = responseData["error"];

          if (errorData.containsKey("message") &&
              errorData["message"] == "Access Denied") {
            // Handle Access Denied error
            print('Access Denied: Incorrect credentials');
            // Display an error message to the user
          } else {
            // Handle other errors
            print('Server error: ${errorData["message"]}');
            // Display an error message to the user
          }
        }
      } else {
        // Handle error
        print('Login error: ${response.body}');
        // Display an error message to the user
      }
    } catch (e) {
      // Handle network or other exceptions
      print('Exception during login: $e');
      // Display an error message to the user
    }
  }
}

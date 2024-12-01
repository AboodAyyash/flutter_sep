import 'package:flutter/material.dart';
import 'package:flutter_sep/main.dart';
import 'package:flutter_sep/pages/login.dart';
import 'package:flutter_sep/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text(userData['userName']),
          ),
          ListTile(
            title: Text("Age"),
            subtitle: Text(userData['age']),
          ),
          ListTile(
            title: Text("Email"),
            subtitle: Text(userData['email']),
          ),
          ListTile(
            title: Text("Password"),
            subtitle: Text(userData['password']),
          ),
          ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString("userId", "null");
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 158, 55, 199),
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

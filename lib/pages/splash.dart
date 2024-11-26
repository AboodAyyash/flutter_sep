import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sep/pages/login.dart';
import 'package:flutter_sep/pages/profile.dart';
import 'package:flutter_sep/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  void checkUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(const Duration(seconds: 1), () {
      String userId = prefs.getString('userId').toString(); // null ==> "null"
      if (userId == "null") {
        print("Login");
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginPage(),
          ),
        );
      } else {
        //call From DB
        Map userData = {};
        for (var i = 0; i < usersData.length; i++) {
          if (usersData[i]['id'] == userId) {
            userData = usersData[i];
            break;
          }
        }

        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ProfilePage(userData: userData),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserId();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}

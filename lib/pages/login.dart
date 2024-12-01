import 'package:flutter/material.dart';
import 'package:flutter_sep/pages/home.dart';
import 'package:flutter_sep/pages/profile.dart';
import 'package:flutter_sep/pages/signup.dart';
import 'package:flutter_sep/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  userData['email'] = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 8 ||
                      !RegExp(r'[A-Z]').hasMatch(value) ||
                      !RegExp(r'[!@#\$&*~]').hasMatch(value) ||
                      !RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must be at least 8 characters and include uppercase, special character, and number';
                  }
                  return null;
                },
                onSaved: (value) {
                  userData['password'] = value!;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(userData);

                        for (var i = 0; i < usersData.length; i++) {
                          if (userData['email'] == usersData[i]['email'] &&
                              userData['password'] ==
                                  usersData[i]['password']) {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString("userId", usersData[i]['id']);
                            userData = usersData[i];
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => HomePage(),
                              ),
                            );
                            break;
                          }
                        }
                        /*  */
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 142, 181, 212),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SignupPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 158, 55, 199),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Signup'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

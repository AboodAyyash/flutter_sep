import 'package:flutter/material.dart';
import 'package:flutter_sep/main.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  const DetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(name),
        ),
      ),
    );
  }
}

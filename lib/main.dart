import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';
  String num1 = '';
  String num2 = '';
  String op = '';
  String display = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [],
        title: Text("Home Page"),
      ),
      body: ListView(
        /*  Column(
        mainAxisAlignment: MainAxisAlignment.end, */
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "$display",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '1'),
              button(title: '2'),
              button(title: '3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '4'),
              button(title: '5'),
              button(title: '6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '7'),
              button(title: '8'),
              button(title: '9'),
              button(title: '0'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
            ],
          ),

          // Calculator end
          Wrap(
            children: [
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
              ],
            ),
          ),

          Container(
            height: 100,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: ListView(
              children: [
                button(title: '+'),
                button(title: '='),
                button(title: '-'),
                button(title: '+'),
                button(title: '='),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              button(title: '+'),
              button(title: '='),
              button(title: '-'),
              button(title: '+'),
              button(title: '='),
            ],
          ),
        ],
      ),
    );
  }

  void clear() {
    result = '';
    display = '';
    num1 = '';
    num2 = '';
    op = '';
  }

  Widget button({title}) {
    return TextButton(
      onPressed: () {
        if (result != '' && (title != '+' || title != '-' || title != '=')) {
          clear();
        }
        if (title == '=') {
          if (op == '') {
            return;
          }
          if (num1 == '') {
            clear();
            return;
          }
          if (op == "+") {
            result = (int.parse(num1) + int.parse(num2)).toString();
          } else {
            result = (int.parse(num1) - int.parse(num2)).toString();
          }
          setState(() {
            display = result;
          });
        } else if (title == '+' || title == "-") {
          op = title;
        } else {
          if (op == '') {
            num1 += title;

            setState(() {
              display = num1;
            });
          } else if (op != '' && title != '=') {
            num2 += title;
            setState(() {
              display = num2;
            });
          }
        }
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

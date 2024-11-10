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
        home: const MyHomePage(title: 'Very simple calculator'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // fields
  int x = 0;
  String result = '';
  String num1 = '';
  String num2 = '';
  String op = '';
  String display = '';
  // functions
  void plusOne() {
    x += 1;
  }

  void minusOne() {
    x -= 1;
  }

//flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (x != 0) {
                    minusOne();
                  }
                });
              },
              icon: const Icon(Icons.exposure_minus_1)),
          Text(x.toString()),
          IconButton(
              onPressed: () {
                setState(() {
                  plusOne();
                });
              },
              icon: const Icon(Icons.plus_one))
        ],
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  " $num1 $op $num2",
                  style: const TextStyle(fontSize: 35),
                ),
              )
            ],
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50, top: 20),
                child: Text(
                  display,
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.greenAccent,
                height: 10,
                width: 500,
                margin: const EdgeInsets.only(bottom: 10),
              )
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '0'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '-'),
              button(title: '+'),
              button(title: '*'),
              button(title: '/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: 'del'),
              button(title: '.'),
              button(title: 'c'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(title: '='),
            ],
          )
        ],
      ),
    );
  }

//functions
  void clear() {
    result = '';
    display = '';
    num1 = '';
    num2 = '';
    op = '';
  }

  void delete() {
    setState(() {
      if (num1.isEmpty) {
        return;
      }

      if (result.isNotEmpty) {
        num1 = result;
        result = "";
        num2 = "";
        num1 = num1.substring(0, num1.length - 1);
        display.isEmpty
            ? display = ""
            : display = display.substring(0, display.length - 1);
        return;
      }

      if (op.isEmpty) {
        num1 = num1.substring(0, num1.length - 1);
        display.isEmpty
            ? display = ""
            : display = display.substring(0, display.length - 1);
      } else if (num2.isNotEmpty) {
        num2 = num2.substring(0, num2.length - 1);
        display.isEmpty
            ? display = ""
            : display = display.substring(0, display.length - 1);
      } else {
        op = '';
      }
    });
  }

  void calculate() {
    if (op == '') {
      return;
    }
    if (num1 == '') {
      clear();
      return;
    }
    if (num2 == '') {
      return;
    }
    switch (op) {
      case "+":
        result = (double.parse(num1) + double.parse(num2)).toString();
        break;
      case "-":
        result = (double.parse(num1) - double.parse(num2)).toString();
        break;
      case "*":
        result = (double.parse(num1) * double.parse(num2)).toString();
        break;
      case "/":
        result = (double.parse(num1) / double.parse(num2)).toString();
        break;
      default:
        result = "0";
    }
  }

  bool isNumberPressedAfterEqual(String title) {
    if (result.isNotEmpty &&
        (title == '1' ||
            title == '2' ||
            title == '3' ||
            title == '4' ||
            title == '5' ||
            title == '6' ||
            title == '7' ||
            title == '8' ||
            title == '9' ||
            title == '0' ||
            title == '.')) {
      return true;
    } else {
      return false;
    }
  }

  bool isOperationPressed(String title) {
    if (title == '+' || title == "-" || title == "*" || title == "/") {
      return true;
    } else {
      return false;
    }
  }

  void beforeAndAfterOperationFunction(String title) {
    if (num1.isEmpty) {
      return;
    }

    if (result.isEmpty) {
      setState(() {
        op = title;
        display = '';
      });
    } else {
      setState(() {
        num1 = result;
        result = '';
        op = title;
        num2 = '';
        display = '';
      });
    }
  }

  //widget
  Widget button({title}) {
    return TextButton(
      onPressed: () {
        //clear is pressed
        if (title == 'c') {
          setState(() {
            clear();
          });
          return;
        }

        if (title == "del") {
          delete();
          return;
        }

        // so that calculator can be reset
        if (isNumberPressedAfterEqual(title)) {
          clear();
        }

        // calculation
        if (title == '=') {
          calculate();
          setState(() {
            display = result;
          });
          //choosing operation type
        } else if (isOperationPressed(title)) {
          beforeAndAfterOperationFunction(title);
        } else {
          // this tells calculator weather num1 to fill or num2
          if (op.isEmpty) {
            num1 += title;
            setState(() {
              display = num1;
            });
          } else if (op.isNotEmpty && title != '=') {
            num2 += title;
            setState(() {
              display = num2;
            });
          }
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey[200], // Optional background color
        foregroundColor: Colors.green, // Text color
        padding: const EdgeInsets.all(10),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}

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
  int _counter = 0;
  int counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String s1 = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              if (counter == 0) {
                return;
              }
              setState(() {
                counter--;
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(
            counter.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.add),
          ),

          /*  IconButton(
            onPressed: () {
              setState(() {
                print(s1);
                if (s1 == "Hello")
                  s1 = "Hi";
                else
                  s1 = "Hello";
                print(s1);
              });
            },
            icon: Icon(Icons.settings),
          ),
          InkWell(
            onLongPress: () {
              print("Click Long");
            },
            onTap: () {
              print("Click");
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              width: 60,
              child: Text(
                s1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber
                ),
              ),
            ),
          ), */

          /*   InkResponse(
            
            onTap: () {
              print("Click");
            },
            child: Text("Hello"),
          ), */

          /*  GestureDetector(

            onTap: () {
              print("Click");
            },
            child: Text("Hello"),
          ), */
        ],
        title: Text("Home Page"),
      ),
      body: Container(
        color: Colors.blue,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
              ),
              child: Text("Hello"),
            ),
            Container(
              color: Colors.amber,
              child: Text("Hello"),
            ),
            Container(
              color: Colors.green,
              child: Text("Hello"),
            ),
            Container(
              color: Colors.yellowAccent,
              child: Text("Hello"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.amber,
                  child: Text("Hello"),
                ),
                Container(
                  color: Colors.green,
                  child: Text("Hello"),
                ),
                Container(
                  color: Colors.yellowAccent,
                  child: Text("Hello"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.red,
      ),
    );
  }
}

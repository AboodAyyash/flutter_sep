import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sep/pages/profile.dart';
import 'package:flutter_sep/pages/search.dart';
import 'package:flutter_sep/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> freinds = [
    Person(
        name: "Ahmad", image: "assets/images/image.jpg", lastMessage: "Hello"),
    Person(
        name: "Omar", image: "assets/images/image.jpg", lastMessage: "9:00 AM"),
    Person(
        name: "Khaled", image: "assets/images/image.jpg", lastMessage: "Hi!"),
    Person(
        name: "Abeer",
        image: "assets/images/image.jpg",
        lastMessage: "Hello Hello"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SearchPage(),
                ),
              );
            },
            icon: Icon(Icons.person_add),
          ),
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => ProfilePage(
                  
                  ),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  hintText: "Text Here"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: freinds.length,
              itemBuilder: (context, index) {
                return freindTile(freinds[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget freindTile(Person person) {
    return ListTile(
      title: Text(person.name),
      subtitle: Text(person.lastMessage),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          person.image,
        ),
      ),
    );
  }
}

class Person {
  String name;
  String lastMessage;
  String image;

  Person({required this.name, required this.image, required this.lastMessage});
}

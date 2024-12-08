import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sep/controller/home.dart' as homeController;
import 'package:flutter_sep/models/person.dart';
import 'package:flutter_sep/pages/chat.dart';
import 'package:flutter_sep/pages/profile.dart';
import 'package:flutter_sep/pages/search.dart';
import 'package:flutter_sep/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> searchList = [];
  TextEditingController textEditingController = TextEditingController();
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
                  builder: (BuildContext context) => ProfilePage(),
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
              controller: textEditingController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search",
                  hintText: "Text Here"),
              onChanged: (value) {
                setState(() {
                  searchList = homeController.search(value);
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  searchList.isNotEmpty || textEditingController.text.isNotEmpty
                      ? searchList.length
                      : freinds.length,
              itemBuilder: (context, index) {
                return freindTile(searchList.isNotEmpty ||
                        textEditingController.text.isNotEmpty
                    ? searchList[index]
                    : freinds[index]);
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
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ChatPage(
              friend: person,
            ),
          ),
        );
      },
    );
  }
}

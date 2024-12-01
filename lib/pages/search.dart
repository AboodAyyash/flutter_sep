import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchPerson> freinds = [
    SearchPerson(
      name: "Ahmad",
      isAdded: false,
      isRequest: false,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Omar",
      isAdded: false,
      isRequest: false,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Khaled",
      isAdded: false,
      isRequest: false,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Abeer",
      isAdded: false,
      isRequest: false,
      image: "assets/images/image.jpg",
    ),
  ];

  List<SearchPerson> requesFreinds = [
    SearchPerson(
      name: "Ahmad",
      isAdded: false,
      isRequest: true,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Omar",
      isAdded: false,
      isRequest: true,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Khaled",
      isAdded: false,
      isRequest: true,
      image: "assets/images/image.jpg",
    ),
    SearchPerson(
      name: "Abeer",
      isAdded: false,
      isRequest: true,
      image: "assets/images/image.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: requesFreinds.length,
              itemBuilder: (context, index) {
                return freindTile(requesFreinds[index]);
              },
            ),
          ),
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

  Widget freindTile(SearchPerson person) {
    return ListTile(
      title: Text(person.name),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          person.image,
        ),
      ),
      trailing: person.isRequest
          ? SizedBox(
              width: 80,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )
          : IconButton(
              onPressed: () {
                setState(() {
                  person.isAdded = true;
                });
              },
              icon: person.isAdded
                  ? Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : Icon(Icons.person_add),
            ),
    );
  }
}

class SearchPerson {
  String name;
  bool isAdded;
  String image;
  bool isRequest;

  SearchPerson({
    required this.isRequest,
    required this.name,
    required this.isAdded,
    required this.image,
  });
}

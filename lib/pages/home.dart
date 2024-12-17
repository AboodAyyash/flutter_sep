import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/controller/Home.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/add_note.dart';
import 'package:notes_app/shared/data.dart';
import 'package:notes_app/widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch = false;
  List notess = [];

  Note newNote = Note(title: "title", content: "content", id: "id");

  Map<String, dynamic> mapNote = {
    'id': 'id2',
    'title': 'title2',
    'content': 'content2'
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map noteMap = newNote.toMap();
    print(newNote);
    print(noteMap);
    Note newMApNote = Note.fromMap(mapNote);
    print(mapNote);
    print(newMApNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (value) {
                  notesSearchList = searchInNotes(value);

                  setState(() {
                    notesSearchList;
                  });
                },
              )
            : Text(
                'Notes',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 59, 59, 59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: Icon(isSearch ? Icons.search_off : Icons.search),
          ),
          SizedBox(width: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newNote = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          );
          newNote = {
            'title': titleController.text,
            'content': contentController.text,
          };
          print(newNote);

          titleController.clear();
          contentController.clear();
          notess.add(newNote);
          print(notess.length);
        },
        backgroundColor: Color.fromARGB(100, 37, 37, 37),
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        elevation: 2,
        highlightElevation: 2,
        splashColor: Colors.transparent,
        child: Icon(
          Icons.add,
          size: 40,
          /*    color: Color(0xFFfffff), */
        ),
      ),
      body: notesSearchList.isNotEmpty || isSearch
          ? ListView.builder(
              itemCount: notesSearchList.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notesSearchList[index],
                );
              },
            )
          : StreamBuilder(
              stream: streamNoteController.stream,
              builder: (context, snapshot) {
                return notes.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/image.jpg')),
                          Text(
                            'Create your first note !',
                            style: TextStyle(
                              color: Color.fromARGB(100, 255, 255, 255),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: Key(notes[index].id),
                            onDismissed: (direction) {
                              removeNote(context, notes[index]);
                              log('${notes.length}');
                            },
                            background: Container(
                              color: Colors.red,
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: NoteCard(
                              note: notes[index],
                            ),
                          );
                        },
                      );
              },
            ),
    );
  }
}

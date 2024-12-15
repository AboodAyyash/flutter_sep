import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/add_note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });
  final Note note;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(20),
      color: note.color,
      child: ListTile(
        splashColor: Colors.transparent,
        title: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              note.title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w900,
               fontSize: 25
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNote(
                note: note,
              ),
            ),
          );
        },
      ),
    );
  }
}

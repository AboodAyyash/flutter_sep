import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/shared/data.dart';

List<Note> searchInNotes(String value) {
  final List<Note> list = value.isEmpty
      ? []
      : notes.where((note) {
          return note.title.toLowerCase().contains(value.toLowerCase());
        }).toList();

  return list;
}

void removeNote(BuildContext context, Note note) {
  final index = notes.indexOf(note);
  notes.removeAt(index);

  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    undoNoteRemoval(index, note),
  );

  streamNoteController.sink.add(notes);
}

SnackBar undoNoteRemoval(int index, Note note) {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Row(
      children: [
        Text(
          note.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            if (notes.isNotEmpty && notes[index] == note) {
              return;
            }
            notes.insert(index, note);
            streamNoteController.sink.add(note);
          },
          child: Text(
            'undo',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

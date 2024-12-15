import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

List<Note> notes = [
  Note(
      title: 'UI concepts worth exsisting',
      content: 'Course',
      color: Colors.white)
];
List<Note> notesSearchList = [];
var streamNoteController = StreamController.broadcast();
final titleController = TextEditingController();
final contentController = TextEditingController();
final random = Random();


Color randomColor() {
  return Color.fromARGB(
    255,
    random.nextInt(256), //88    //55
    random.nextInt(256), //214   //214
    random.nextInt(256), //15    //15
  );
}

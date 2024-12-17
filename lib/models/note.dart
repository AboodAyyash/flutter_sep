import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Note {
  Note({
    required this.title,
    required this.content,
    required this.id,
    /*  required this.color, */
  });

  String id;
  String title;
  String content;
/*   Color color; */

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content, /* 'color': color.value */
    };
  }

  /*  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(content: map['content'], title: map['title'], id: map['id']);
  } */

  Note.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        content = map['content'];
}

//var type from DB = Map, to stoer from Map to Note i need Converter

//Map noteMap = {'id':"1","title":"Note Title",'content':"Note Content"};

//Note noteConverted = Note.fromMap(noteMap);

//noteConverted.id => "1"

//Map noteMap2 = noteConverted.toMap();

//noteMap2 = {'id':"1","title":"Note Title",'content':"Note Content"};

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Note {
  Note({
    required this.title,
    required this.content,
    required this.color,
  }) : id = uuid.v4();

  String id;
  String title;
  String content;
  Color color;
}

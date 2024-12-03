
import 'package:flutter/material.dart';

class Message {
  final String msg;
  final String name;
  final String time;
  final Color color;
  final bool isFriendMsg;

  Message({
    required this.msg,
    required this.name,
    required this.time,
    required this.color,
    required this.isFriendMsg,
  });
}


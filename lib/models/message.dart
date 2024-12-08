import 'package:flutter/material.dart';

class Message {
  final String msg;
  final String senderName;
  final String receiverName;
  final String name;
  final String time;
  final Color color;
  final String type;
  final String? image;
  final bool isFriendMsg;

  Message({
    required this.msg,
    required this.senderName,
    required this.receiverName,
    required this.name,
    required this.time,
    required this.color,
    required this.type,
    required this.image,
    required this.isFriendMsg,
  });
}
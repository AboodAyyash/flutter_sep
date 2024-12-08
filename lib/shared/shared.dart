import 'dart:async';
import 'package:flutter_sep/models/person.dart';

List<Map> usersData = [
  {
    'age': "1",
    'id': "1",
    'userName': "1",
    "email": "email1@email.com",
    'password': "Password@123"
  },
  {
    'age': "2",
    'id': "2",
    'userName': "2",
    "email": "email2@email.com",
    'password': "Password@123"
  },
  {
    'age': "3",
    'id': "3",
    'userName': "3",
    "email": "email3@email.com",
    'password': "Password@123"
  },
];
List<Person> freinds = [
  Person(
      name: "Ahmad",
      image: "assets/images/image.jpg",
      lastMessage:
          "message.msgmessage.msg message.msg message.msg message.msgmessage.msg message.msgmessage.msg message.msg message.msg message.msgmessage.msg message.msgmessage.msg message.msg message.msg message.msgmessage.msg message.msgmessage.msg message.msg message.msg message.msgmessage.msg message.msgmessage.msg message.msg message.msg message.msgmessage.msg"),
  Person(
      name: "Omar", image: "assets/images/image.jpg", lastMessage: "9:00 AM"),
  Person(name: "Khaled", image: "assets/images/image.jpg", lastMessage: "Hi!"),
  Person(
      name: "Abeer",
      image: "assets/images/image.jpg",
      lastMessage: "Hello Hello"),
];

List messages = [];

String locale = 'en';
Map userData = {};

List allUsers = [];

List freindsRequest = [];

var streamChatController  = StreamController.broadcast();




/* Future futureMethod() async {
  return "";
}

var source;
Stream streamMethod() {
  return source;
}
 */
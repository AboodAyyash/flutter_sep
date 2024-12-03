import 'package:flutter_sep/models/message.dart';
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

List messages =
    []; //need new model //msg, sender name, reciver name, time, type, image, color, isFreindMsg

String locale = 'en';
Map userData = {};

List allUsers = []; //need new model //name, image, isFreind, email, sendRequest

List freindsRequest =
    []; //need new model  //name ,isAccepted, isRejected, email, image,


//reDesigen for Message bubble in chat page


//show image message and edit model 

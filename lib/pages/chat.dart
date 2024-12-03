import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sep/models/message.dart';
import 'package:flutter_sep/models/person.dart';
import 'package:flutter_sep/pages/home.dart';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  final Person friend;

  const ChatPage({super.key, required this.friend});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];
  File? _selectedImage;

  Person? friend;

  Color freindMsgColor = const Color.fromARGB(255, 210, 204, 204);

  Color meMsgColor = const Color.fromARGB(255, 210, 195, 236);

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    friend = widget.friend;
    if (widget.friend.lastMessage != "") {
      setState(() {
        _messages.add(Message(
          msg: widget.friend.lastMessage,
          name: widget.friend.name,
          time: "${(DateTime.now().hour)}:${(DateTime.now().minute)}",
          color: freindMsgColor,
          isFriendMsg: true,
        ));
      });
    }
  }

  void _sendMessage() {
    if (_messageController.text != "") {
      setState(() {
        _messages.add(Message(
            msg: _messageController.text.toString(),
            name: 'Me',
            time: "${(DateTime.now().hour)}:${(DateTime.now().minute)}",
            isFriendMsg: false,
            color: meMsgColor));
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.friend.image),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.friend.name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Active now',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                Message message = _messages[index];
                return Align(
                  alignment: message.isFriendMsg
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width:
                        message.msg.length < 20 ? 130 : message.msg.length * 3,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 200),
                    color: message.color,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(message.isFriendMsg
                                ? message.name
                                : message.time),
                            Spacer(),
                            Text(message.isFriendMsg
                                ? message.time
                                : message.name),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Text(message.msg),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Aa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//TF for messages
//call icon
//friend image
//friend name
//record icon
//pick image icon
//send message button
//message widget (msg, name, time,color)
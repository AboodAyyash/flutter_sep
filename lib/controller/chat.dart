import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sep/models/message.dart';
import 'package:flutter_sep/shared/shared.dart';
import 'package:image_picker/image_picker.dart';

final TextEditingController messageController = TextEditingController();
final List<Message> messages = [];
File? selectedImage;

Color meMsgColor = const Color.fromARGB(255, 210, 195, 236);

Future<void> pickImage() async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    selectedImage = File(pickedImage.path);
  }
}

void sendMessage() {
  if (messageController.text != "") {
 
      messages.add(Message(
        msg: messageController.text.toString(),
        name: 'Me',
        time: "${(DateTime.now().hour)}:${(DateTime.now().minute)}",
        isFriendMsg: false,
        color: meMsgColor,
        image: "",
        receiverName: "",
        senderName: "",
        type: "",
      ));
      streamChatController.sink.add("Msg Added");
      messageController.clear();
 
  }
}

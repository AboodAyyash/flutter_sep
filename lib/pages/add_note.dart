import 'package:flutter/material.dart';
import 'package:notes_app/controller/note.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/shared/data.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key, this.note});
  final Note? note;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  void initialNote() {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  @override
  void initState() {
    super.initState();
    initialNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    titleController.clear();
                    contentController.clear();
                  }
                  Navigator.of(context).pop();
                },
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 59, 59),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: Icon(Icons.arrow_back),
              )
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              if (titleController.text.isEmpty ||
                  contentController.text.isEmpty) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  showSnackBar(
                    context: context,
                    content: titleController.text.isEmpty
                        ? 'Title must be entered.'
                        : 'Content must be entered.',
                  ),
                );
                return;
              }

              if (widget.note != null) {
                updateNote(widget.note!);
                Navigator.of(context).pop(widget.note!);
              } else {
                saveNote();
                Navigator.of(context).pop('add');
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 59, 59, 59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            icon: Icon(Icons.save),
          ),
          SizedBox(
            width: 11,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              cursorColor: Color.fromARGB(255, 255, 255, 255),
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 154, 154, 154),
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
            SizedBox(
              height: 37,
            ),
            TextField(
              controller: contentController,
              cursorColor: Color.fromARGB(255, 255, 255, 255),
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Type something...',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 154, 154, 154),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}

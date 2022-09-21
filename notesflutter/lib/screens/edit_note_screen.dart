import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/models/note.dart';

class EditNoteScreen extends StatefulWidget {
  // CONSTRUCTORS
  const EditNoteScreen({super.key, required this.note});

  // PROPERTIES
  final Note note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    final text = widget.note.content;
    _textController = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // BUILD METHOD
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Edit'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  decoration: const BoxDecoration(border: null),
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  controller: _textController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

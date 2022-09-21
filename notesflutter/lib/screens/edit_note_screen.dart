import 'package:flutter/cupertino.dart';
import 'package:notesflutter/models/note.dart';

class EditNoteScreen extends StatelessWidget {
  // CONSTRUCTORS
  const EditNoteScreen({super.key, required this.note});

  // PROPERTIES
  final Note note;

  // BUILD METHOD
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Edit'),
      ),
      child: Container(
        child: Text("Edit"),
      ),
    );
  }
}

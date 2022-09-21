import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesflutter/datastore/datastore.dart';
import 'package:notesflutter/screens/edit_note_screen.dart';
import 'package:notesflutter/widgets/note_cell.dart';

class AllNotesScreen extends StatelessWidget {
  // CONSTRUCTORS
  AllNotesScreen({super.key});

  // PROPERTIES

  // Model
  final _notes = DataStore.shared.getAllNotes();

  // BUILD METHOD
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('All notes'),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Divider(
            color: Colors.grey,
          ),
        ),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditNoteScreen(
                    note: note,
                  ),
                ),
              );
            },
            child: NoteCell(
              title: note.title,
              subtitle: note.subtitle,
              isFavorite: note.isFavorite,
            ),
          );
        },
      ),
    );
  }
}

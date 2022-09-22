import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesflutter/datastore/datastore.dart';
import 'package:notesflutter/providers/providers.dart';
import 'package:notesflutter/screens/edit_note_screen.dart';
import 'package:notesflutter/widgets/note_cell.dart';

class AllNotesScreen extends ConsumerWidget {
  // CONSTRUCTORS
  AllNotesScreen({super.key});

  // PROPERTIES

  // Model
  final _notes = [];

  // BUILD METHOD
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataStore = ref.read(dataStoreProvider);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('All notes'),
        trailing: CupertinoButton(
            child: const Icon(Icons.add),
            onPressed: () {
              dataStore.addNote();
            }),
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

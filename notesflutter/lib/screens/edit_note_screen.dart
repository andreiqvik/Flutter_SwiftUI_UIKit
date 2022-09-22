import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notesflutter/models/note.dart';
import 'package:notesflutter/providers/providers.dart';

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
    return Consumer(builder: (context, ref, child) {
      final dataStore = ref.read(dataStoreProvider);

      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Edit'),
          trailing: CupertinoButton(
              child: const FaIcon(FontAwesomeIcons.trashCan),
              onPressed: () {
                dataStore.deleteNote(note: widget.note);
                Navigator.pop(context);
              }),
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
                    onChanged: (content) {
                      dataStore.updateNote(note: widget.note, content: content);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

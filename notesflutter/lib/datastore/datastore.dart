import 'package:notesflutter/models/note.dart';

class DataStore {
  // SINGLETON
  DataStore._();
  static final shared = DataStore._();

  // CREATE

  // READ
  List<Note> getAllNotes() {
    final note1 = Note(content: "Note 1");
    note1.title = "Note 1";
    note1.subtitle = "Subtitle";

    final note2 = Note(content: "Note 2");
    note2.title = "Note 2";
    note2.isFavorite = true;

    final note3 = Note(content: "Note 3");
    note3.title = "Note 3";

    return [
      note1,
      note2,
      note3,
    ];
  }

  List<Note> getFavoriteNotes() {
    final notes = getAllNotes();
    return notes.where((note) => note.isFavorite).toList();
  }

  // UPDATE

  // DELETE

}

import 'package:notesflutter/models/note.dart';

class DataStore {
  // SINGLETON
  DataStore._();
  static final shared = DataStore._();

  // CREATE

  // READ
  List<Note> getAllNotes() {
    return [];
  }

  List<Note> getFavoriteNotes() {
    final notes = getAllNotes();
    return notes.where((note) => note.isFavorite).toList();
  }

  // UPDATE

  // DELETE

}

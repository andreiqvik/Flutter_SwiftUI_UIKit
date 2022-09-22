import 'package:notesflutter/constants/constants.dart';
import 'package:notesflutter/models/note.dart';

class DataStore {
  // SINGLETON
  DataStore._();
  static final shared = DataStore._();

  // PROPERTIES

  // METHODS

  // CREATE
  void addNote() {
    /*
    final note = Note(ObjectId(), Constants.defaultNoteContent, DateTime.now());
    realm.write(() {
      realm.add(note);
    });
    */
  }

  // READ
  List<Note> getAllNotes() {
    return [];
  }

  List<Note> getFavoriteNotes() {
    return [];
  }
  // UPDATE

  // DELETE

}

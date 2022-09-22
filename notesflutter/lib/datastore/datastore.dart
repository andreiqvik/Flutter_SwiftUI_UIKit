import 'package:isar/isar.dart';
import 'package:notesflutter/constants/constants.dart';
import 'package:notesflutter/models/note.dart';

class DataStore {
  // PROPERTIES

  // Singleton
  DataStore._();
  static final shared = DataStore._();

  // Isar
  late Isar isar;

  // METHODS

  // INITIALIZATION
  Future<void> initialize() async {
    isar = await Isar.open([NoteSchema]);
  }

  // CREATE
  Future<void> addNote() async {
    final note = Note()
      ..content = Constants.defaultNoteContent
      ..setTitleAndSubtitle();

    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
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

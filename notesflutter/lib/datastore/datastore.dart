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
  Stream<List<Note>> getAllNotesStream() {
    final notesQuery = isar.notes.where().sortByLastUpdateDesc().build();
    final stream = notesQuery.watch(fireImmediately: true);
    return stream;
  }

  Stream<List<Note>> getFavoriteNotesStream() {
    final notesQuery = isar.notes.where().sortByLastUpdateDesc().build();
    final stream = notesQuery.watch(fireImmediately: true);
    return stream;
  }

  // UPDATE
  Future<void> updateNote({required Note note, String? content}) async {
    note.lastUpdate = DateTime.now();
    if (content != null) {
      note.content = content;
      note.setTitleAndSubtitle();
    }
    await isar.writeTxn(() async {
      isar.notes.put(note);
    });
  }

  Future<void> toggleFavorite({required Note note}) async {
    note.isFavorite = !note.isFavorite;
    await isar.writeTxn(() async {
      isar.notes.put(note);
    });
  }

  // DELETE
  Future<void> deleteNote({required Note note}) async {
    await isar.writeTxn(() async {
      await isar.notes.delete(note.id);
    });
  }
}

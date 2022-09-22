import 'package:notesflutter/constants/constants.dart';
import 'package:notesflutter/models/note.dart';
import 'package:realm/realm.dart';

class DataStore {
  // SINGLETON
  DataStore._();
  static final shared = DataStore._();

  // PROPERTIES
  var config = Configuration.local([Note.schema]);
  late var realm = Realm(config);

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
  RealmResults<Note> getAllNotes() {
    return realm.all<Note>();
  }

  RealmResults<Note> getFavoriteNotes() {
    return realm.all<Note>().query("isFavorite == true");
  }
  // UPDATE

  // DELETE

}

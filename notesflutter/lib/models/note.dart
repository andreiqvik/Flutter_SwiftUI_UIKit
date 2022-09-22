import 'package:collection/collection.dart';
import 'package:isar/isar.dart';
part 'note.g.dart';

@collection
class Note {
  // PROPERTIES
  Id id = Isar.autoIncrement;
  String? content;
  String? title;
  String? subtitle;
  bool isFavorite = false;
  DateTime lastUpdate = DateTime.now();

  // METHODS
  void setTitleAndSubtitle() {
    final rows = content?.split("\n");
    if (rows != null) {
      title = rows.firstOrNull;
      if (rows.length > 1) {
        subtitle = rows[1];
      }
    }
  }
}

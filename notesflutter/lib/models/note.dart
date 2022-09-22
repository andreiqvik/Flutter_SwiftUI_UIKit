import 'package:isar/isar.dart';
part 'note.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement;
  String? content;
  String? title;
  String? subtitle;
  bool isFavorite = false;
  DateTime lastUpdate = DateTime.now();
}

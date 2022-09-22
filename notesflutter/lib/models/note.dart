import 'package:realm/realm.dart';
part 'note.g.dart';

@RealmModel()
class _Note {
  @PrimaryKey()
  late String id;
  late String content;
  String? title;
  String? subtitle;
  bool isFavorite = false;
  late DateTime lastUpdate;
}

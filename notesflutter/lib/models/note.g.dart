// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObject {
  static var _defaultsSet = false;

  Note(
    int id,
    String content,
    DateTime lastUpdate, {
    String? title,
    String? subtitle,
    bool isFavorite = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObject.setDefaults<Note>({
        'isFavorite': false,
      });
    }
    RealmObject.set(this, 'id', id);
    RealmObject.set(this, 'content', content);
    RealmObject.set(this, 'title', title);
    RealmObject.set(this, 'subtitle', subtitle);
    RealmObject.set(this, 'isFavorite', isFavorite);
    RealmObject.set(this, 'lastUpdate', lastUpdate);
  }

  Note._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  String get content => RealmObject.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObject.set(this, 'content', value);

  @override
  String? get title => RealmObject.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObject.set(this, 'title', value);

  @override
  String? get subtitle => RealmObject.get<String>(this, 'subtitle') as String?;
  @override
  set subtitle(String? value) => RealmObject.set(this, 'subtitle', value);

  @override
  bool get isFavorite => RealmObject.get<bool>(this, 'isFavorite') as bool;
  @override
  set isFavorite(bool value) => RealmObject.set(this, 'isFavorite', value);

  @override
  DateTime get lastUpdate =>
      RealmObject.get<DateTime>(this, 'lastUpdate') as DateTime;
  @override
  set lastUpdate(DateTime value) => RealmObject.set(this, 'lastUpdate', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObject.getChanges<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Note._);
    return const SchemaObject(Note, 'Note', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('subtitle', RealmPropertyType.string, optional: true),
      SchemaProperty('isFavorite', RealmPropertyType.bool),
      SchemaProperty('lastUpdate', RealmPropertyType.timestamp),
    ]);
  }
}

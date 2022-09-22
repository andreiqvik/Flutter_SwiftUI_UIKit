import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesflutter/datastore/datastore.dart';

final dataStoreProvider = Provider((ref) => DataStore.shared);

final allNotesStreamProvider = StreamProvider((ref) {
  final dataStore = ref.watch(dataStoreProvider);
  return dataStore.getAllNotesStream();
});

final favoriteNotesStreamProvider = StreamProvider((ref) {
  final dataStore = ref.watch(dataStoreProvider);
  return dataStore.getFavoriteNotesStream();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesflutter/datastore/datastore.dart';

final dataStoreProvider = Provider((ref) => DataStore.shared);

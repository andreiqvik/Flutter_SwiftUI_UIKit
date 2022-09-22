import 'package:flutter/cupertino.dart';
import 'package:notesflutter/datastore/datastore.dart';
import 'package:notesflutter/screens/maintabsscreen.dart';

void main() async {
  await DataStore.shared.initialize();
  runApp(const CupertinoTabBarApp());
}

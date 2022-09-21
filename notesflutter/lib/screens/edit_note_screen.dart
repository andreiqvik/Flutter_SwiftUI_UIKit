import 'package:flutter/cupertino.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Edit'),
      ),
      child: Container(
        child: Text("Edit"),
      ),
    );
  }
}

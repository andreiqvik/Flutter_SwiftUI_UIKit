class Note {
  // PROPERTIES
  String content;
  String? title;
  String? subtitle = "Subtitle";
  bool isFavorite = false;

  // CONSTRUCTORS
  Note({required this.content, this.isFavorite = false});
}

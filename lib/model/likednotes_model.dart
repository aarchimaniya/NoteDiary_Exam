// models/note_model.dart
class NoteModel {
  String? id;
  String title;
  String content;

  NoteModel({this.id, required this.title, required this.content});

  factory NoteModel.fromFirestore(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}

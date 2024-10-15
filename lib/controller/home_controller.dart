import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/likednotes_model.dart';
import '../services/firestore_services.dart';
import '../services/sqlite_services.dart';
import '../view/screens/notes_dialog/notes_dialog.dart';

class HomeController extends GetxController {
  var notes = <NoteModel>[].obs;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  void fetchNotes() async {
    notes.value = await _firestoreService.getNotes();
  }

  void addNoteDialog() {
    Get.dialog(NoteDialog(onSubmit: (title, content) {
      _firestoreService.addNote(NoteModel(title: title, content: content));
      fetchNotes();
    }));
  }

  void editNoteDialog(NoteModel note) {
    Get.dialog(NoteDialog(
      title: note.title,
      content: note.content,
      onSubmit: (title, content) {
        _firestoreService.updateNote(note.id!, title, content);
        fetchNotes();
      },
    ));
  }

  void deleteNote(String id) {
    _firestoreService.deleteNote(id);
    fetchNotes();
  }

  void likeNote(NoteModel note) {
    SQLiteService.insertLikedNote(note);
  }
}

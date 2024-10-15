import 'package:get/get.dart';
import '../model/likednotes_model.dart';
import '../services/sqlite_services.dart';

class LikedNotesController extends GetxController {
  var likedNotes = <NoteModel>[].obs;

  @override
  void onInit() {
    fetchLikedNotes();
    super.onInit();
  }

  void fetchLikedNotes() async {
    likedNotes.value = await SQLiteService.getLikedNotes();
  }

  void deleteLikedNote(NoteModel note) {
    SQLiteService.deleteLikedNoteById(note.id!);
    fetchLikedNotes();
  }
}

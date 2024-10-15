import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/likednotes_model.dart';

class FirestoreService {
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<List<NoteModel>> getNotes() async {
    QuerySnapshot snapshot = await _notesCollection.get();
    return snapshot.docs
        .map((doc) =>
            NoteModel.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addNote(NoteModel note) {
    return _notesCollection.add(note.toFirestore());
  }

  Future<void> updateNote(String id, String title, String content) {
    return _notesCollection
        .doc(id)
        .update({'title': title, 'content': content});
  }

  Future<void> deleteNote(String id) {
    return _notesCollection.doc(id).delete();
  }
}

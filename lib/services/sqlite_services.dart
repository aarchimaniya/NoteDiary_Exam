import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/likednotes_model.dart';

class SQLiteService {
  static Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'liked_notes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE liked_notes(id TEXT PRIMARY KEY, title TEXT, content TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertLikedNote(NoteModel note) async {
    final db = await _openDatabase();
    await db.insert('liked_notes', note.toFirestore());
  }

  static Future<List<NoteModel>> getLikedNotes() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('liked_notes');
    return List.generate(maps.length, (i) {
      return NoteModel.fromFirestore(maps[i]);
    });
  }

  static Future<void> deleteLikedNoteById(String id) async {
    final db = await _openDatabase();
    await db.delete('liked_notes', where: 'id = ?', whereArgs: [id]);
  }
}

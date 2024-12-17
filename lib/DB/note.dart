import 'package:notes_app/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDatabaseHelper {
  static final NoteDatabaseHelper instance = NoteDatabaseHelper._init();
  static Database? _database;

  NoteDatabaseHelper._init();

  String tableName = 'notes';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath); //apppath/folder1name/notes.db

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableName (
  id $idType,
  title $textType,
  content $textType
)
''');
  }

  // Insert Note
  Future<void> insertNote(Note note) async {
    final db = await instance.database;
    await db.insert(
      tableName,
      note.toMap(),
    );
  }

  // Get All Notes
  Future<List<Note>> getNotes() async {
    final db = await instance.database;

    final result = await db.query(tableName);

    return result.map((json) => Note.fromMap(json)).toList();
  }

  // Update Note
  Future<int> updateNote(Note note) async {
    // {'title':"t 2",'content:'c','id':"1"}
    final db = await instance.database;

    return await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id], // "1"
    );
  }

  // Delete Note
  Future<int> deleteNote(String id) async {
    final db = await instance.database;

    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}



/* 


1
2
3
5
6
7
4


 */
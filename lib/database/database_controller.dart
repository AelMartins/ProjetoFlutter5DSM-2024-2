import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseController {
  static Database? _database;
  static const String dbName = 'livros.db';
  static const String tableName = 'livros';
  
  // Criação da tabela no banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            capa TEXT,
            titulo TEXT,
            autor TEXT,
            editora TEXT,
            edicao TEXT,
            enderecoFabricacao TEXT,
            dataPublicacao TEXT,
            isbn TEXT,
            descricao TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Método para inserir um novo livro
  Future<void> insertLivro(Map<String, dynamic> livro) async {
    final db = await database;
    await db.insert(
      tableName,
      livro,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Método para listar todos os livros
  Future<List<Map<String, dynamic>>> getLivros() async {
    final db = await database;
    return db.query(tableName);
  }
}

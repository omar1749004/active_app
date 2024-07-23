import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static final SqlDb _instance = SqlDb._internal();
  static Database? _db;

  SqlDb._internal();


//Each time SqlDb() is called, it returns the same _instance, ensuring only one instance of SqlDb exists.
  factory SqlDb() {
    return _instance;
  }

  Future<Database?> get database async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "omar.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("ALTER TABLE note ADD title TEXT NOT NULL");
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE note (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subTitle TEXT NOT NULL,
        time DATE NOT NULL,
        color INTEGER NOT NULL
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.rawQuery(sql);
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.rawInsert(sql);
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.rawUpdate(sql);
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.rawDelete(sql);
  }

  Future<void> deleteDatabase() async {
    var databasePath = await getDatabasesPath();
  //  / String path =await join(databasePath, "omar.db");
    await deleteDatabase();
    _db = null;
  }
    

  Future<List<Map<String, dynamic>>> read(String table) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.query(table);
  }

  Future<int> insert(String table, Map<String, Object?> values) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.insert(table, values);
  }

  Future<int> update(String table, Map<String, Object?> values, String where, List<dynamic> whereArgs) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.update(table, values, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(String table, String where, List<dynamic> whereArgs) async {
    Database? mydb = await database;
    if (mydb == null) {
      throw Exception("Database is not initialized");
    }
    return await mydb.delete(table, where: where, whereArgs: whereArgs);
  }
}
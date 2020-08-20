import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'transaction.dart';

class DatabaseHelper {
  static final _databaseName = "Expense.db";
  static final _databaseVersion = 1;

  static final table = 'expense_table';

  static final columnTitle = "title";
  static final columnFrom = "from";
  static final columnTo = "to";
  static final columnCost = "cost";
  static final columnDateTime = "dateTime";
  static final columnId = "id";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnFrom TEXT NOT NULL,
            $columnTo TEXT NOT NULL,
            $columnCost INTEGER NOT NULL
            $columnDateTime DateTime NOT NULL,
          )
          ''');
  }

  Future<int> insert(Transactions transaction) async {
    Database db = await instance.database;
    return await db
        .insert(table, {'title': transaction.title, 'from': transaction.from,'to':transaction.to,'cost':transaction.cost,'dateTime':transaction.dateTime});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnTitle LIKE '%$name%'");
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Transactions transaction) async {
    Database db = await instance.database;
    int id = transaction.toMap()['id'];
    return await db.update(table, transaction.toMap(),
        where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}

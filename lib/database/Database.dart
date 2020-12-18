import 'package:remis/utils/account/accountlogin.dart';
import 'package:remis/utils/account/accountusernameandpassword.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), "remis_db"),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users(
        id INTEGER PRIMARY KEY, email TEXT NOT NULL, firstname TEXT, lastname TEXT, phonenumber TEXT NOT NULL, token TEXT NOT NULL
        )
        ''');
      await db.execute('''
        CREATE TABLE logindetails(
        id INTEGER PRIMARY KEY, email TEXT NOT NULL, password TEXT NOT NULL
        )
        ''');
    }, version: 1);
  }

  setUpUser(AccountLogin newUser) async {
    final db = await database;
    var res = await db.rawInsert(''' 
     INSERT INTO users(
     email, firstName, lastName, phoneNumber, token
     ) VALUES(?, ?, ?, ?, ?)
     ''', [
      newUser.email,
      newUser.firstName,
      newUser.lastName,
      newUser.phoneNumber,
      newUser.token
    ]);
    return res;
  }

  setUpLoginDetails(username, password) async {
    final db = await database;
    var res = await db.rawInsert(''' 
     INSERT INTO logindetails(
     email, password
     ) VALUES(?, ?)
     ''', [username, password]);
    return res;
  }

  Future<List<AccountLogin>> getUser() async {
    final db = await database;
    var res = await db.query("users");
    List<AccountLogin> list =
        res.isNotEmpty ? res.map((e) => AccountLogin.fromDB(e)).toList() : [];

    return list;
  }

  Future<List> getLoginDetails() async {
    final db = await database;
    var res = await db.query("logindetails");
    List<AccountLogin> list = res.isNotEmpty
        ? res.map((e) => AccountUsernamePassword.fromDB(e)).toList()
        : [];
    return list;
  }
}

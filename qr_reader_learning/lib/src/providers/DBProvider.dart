import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider
{
  static Database _database;
  static final DBProvider db = DBProvider._private();

  DBProvider._private();

  Future<Database> get database async
  {
    if(_database == null)
    {
      _database = await initDB();
    }
    return _database;

    ////Hace lo mismo, pero se queda aqui a fines de comprender mejor el patrón singleton
    // if(_database != null)
    // {
    //   return _database;
    // }
    // else
    // {
    //   _database = await initDB();
    //   return _database;
    // }
  }

  initDB() async
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, "ScansDB.db");

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async
      {
        await db.execute(
          'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY, '
          ' type TEXT, '
          ' value TEXT'
          ')'
        );

      });



  }  
  
}
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader_learning/src/models/ScanModel.dart';
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

  //Connection, inicializa bases de datos de SQFLite
  initDB() async
  {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, "ScansDB.db");
    String createTableString = 'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY, '
          ' type TEXT, '
          ' value TEXT'
          ')';

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async
      {
        await db.execute(createTableString);

      });
  }  
//////////////////////////////////////INSERT//////////////////////////////////
  //Crear registros
  Future<int> newScanRaw(ScanModel scan) async
  {
    final db = await database;
    String insertString = "INSERT INTO Scans (id, type, value) VALUES (${scan.id}, '${scan.type}', '${scan.value}')";
    
    final results = await db.rawInsert(insertString);

    return results;

  }

  //Insertar como json, muy facil!
  Future<int> newScan( ScanModel scan ) async
  {
    final datab = await database;

    final results = await datab.insert('Scans', scan.toJson());

    return results;
  }
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////SELECT//////////////////////////////////
  //Obtener respuestas unicas
  Future<ScanModel> getScanId(int id) async
  {
    final datab = await database;
    //Tamaño de arreglo en whereargs == variables en el where
    final response = await datab.query("Scans", where: "id = ?", whereArgs: [id]);

    return response.isNotEmpty ? ScanModel.fromJson(response.first) : null;
  }

  //Obtener todos
  Future<List<ScanModel>> getAllScans() async
  {
    List<ScanModel> list = [];

    final datab = await database;
    //Tamaño de arreglo en whereargs == variables en el where
    final response = await datab.query("Scans");

    if(response.isNotEmpty)
    {
      list = response.map((value) => ScanModel.fromJson(value)).toList();  
    }

    return list;

  }

  //Regresar con condicion con RawQuery (no aconsejable)
  Future<List<ScanModel>> getScansPerType(String type) async
  {
    List<ScanModel> list = [];
    String selectString = "SELECT * FROM Scans WHERE type = '$type'";

    final datab = await database;
    //Tamaño de arreglo en whereargs == variables en el where
    final response = await datab.rawQuery(selectString);

    if(response.isNotEmpty)
    {
      list = response.map((value) => ScanModel.fromJson(value)).toList();  
    }

    return list;

  }

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////UPDATE//////////////////////////////////
  //Actualizar registros unicos
  Future<int> updateScan(ScanModel scan) async
  {
    final datab = await database;
    //Tamaño de arreglo en whereargs == variables en el where
    int response = await datab.update("Scans", scan.toJson(), where: "id = ?", whereArgs: [scan.id]);

    return response;
  }
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////DELETE//////////////////////////////////

  //Eliminar registros especificos
  Future<int> deleteScan(int id) async
  {
    final datab = await database;
    int  response = await datab.delete("Scans", where: "id = ?", whereArgs: [id]);
    return response;
  }
  //Borra todos los scans
  Future<int> deleteAll(int id) async
  {
    final datab = await database;
    int  response = await datab.delete("Scans");
    return response;
  }

  //Borra todos los scans
  Future<int> deleteAllWithRaw(int id) async
  {
    final datab = await database;
    int  response = await datab.rawDelete("DELETE FROM Scans");
    return response;
  }
//////////////////////////////////////////////////////////////////////////////

}
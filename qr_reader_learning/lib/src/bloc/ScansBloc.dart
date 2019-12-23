import 'dart:async';

import 'package:qr_reader_learning/src/bloc/Validators.dart';
import 'package:qr_reader_learning/src/providers/DBProvider.dart';



class ScansBloc with Validators{

  static final ScansBloc _singleton = new ScansBloc._private();

  factory ScansBloc()
  {
    return _singleton;
  }

  ScansBloc._private(){
    getScans();
  }


  //Scanmodel exportado desde dbProvider
  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStreamGeo => _scansStreamController.stream.transform(validateGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansStreamController.stream.transform(validateHttp);

  void dispose() { 
    
    _scansStreamController?.close();
  }

  createScan(ScanModel scan) async
  {
    await DBProvider.connection.newScan(scan);
    getScans();
  }

  getScans() async
  {
    _scansStreamController.sink.add(await DBProvider.connection.getAllScans());
  }

  deleteScans(int id)async
  {
    await DBProvider.connection.deleteScan(id);
    getScans();

  }

  deleteAllScans()async
  {
    await DBProvider.connection.deleteAll();
    getScans();
  }



  
}
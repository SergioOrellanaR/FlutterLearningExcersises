import 'dart:async';

import 'package:qr_reader_learning/src/models/ScanModel.dart';

class Validators {

  //Primer argumento (List<ScanModel>) = lo que entra, segundo argumento (List<ScanModel>) = lo que sale. (En handle data scans es entrada y sink es salida)
  final validateGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      //Solo recoge aquellos que valor sea igual a Geo... ES COMO LINQ!!
      final geoScans = scans.where((value) => value.type == "geo").toList();
      sink.add(geoScans);
    },
  );

  final validateHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      //Solo recoge aquellos que valor sea igual a Http... ES COMO LINQ!!
      final geoScans = scans.where((value) => value.type == "http").toList();
      sink.add(geoScans);
    },
  );



}

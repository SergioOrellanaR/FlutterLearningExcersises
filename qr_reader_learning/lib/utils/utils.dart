
import 'package:qr_reader_learning/src/models/ScanModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

openScan(ScanModel scan, BuildContext context) async {

  if(scan.type == "http")
  {
    String url = scan.value;
    if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir $url';
  }
  }
  else
  {
    Navigator.pushNamed(context, "map", arguments: scan);
  }

  
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_reader_learning/src/bloc/ScansBloc.dart';
import 'package:qr_reader_learning/src/models/ScanModel.dart';
import 'package:qr_reader_learning/src/pages/AddressesPage.dart';
import 'package:qr_reader_learning/src/pages/MapsPage.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_reader_learning/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScansBloc scansBloc = new ScansBloc();

  int _currentBottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.deleteAllScans,
          )
        ],
      ),
      body: _callPage(_currentBottomBarIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: () => _scanQR(context),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  _scanQR(BuildContext context) async {
    //Scanned string = https://www.reddit.com/
    //Scanned geo    = geo:-33.50540437638074,-70.79436078509218

    String futureString = "";

    try {
      futureString = await BarcodeScanner.scan();
      
      if (futureString != null) {
      ScanModel scan = ScanModel(value: futureString);

      scansBloc.createScan(scan);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750));
      }
      
      utils.openScan(scan, context);
    }
    } catch (e) {
      futureString = e.toString();
    }
    
  }

  _scanQRTest(BuildContext context) async {
    String futureString = "geo:-33.50540437638074,-70.79436078509218";
    //String futureString = "https://www.reddit.com/";

    if (futureString != null) {
      ScanModel scan = ScanModel(value: futureString);

      scansBloc.createScan(scan);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750));
      }
      utils.openScan(scan, context);
    }
  }

  BottomNavigationBar _createBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text("Maps"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), title: Text("Addresses"))
      ],
      currentIndex: _currentBottomBarIndex,
      onTap: (value) {
        setState(() {
          _currentBottomBarIndex = value;
        });
      },
    );
  }

  _callPage(int actualPage) {
    switch (actualPage) {
      case 0:
        return MapsPage();

      case 1:
        return AdressesesPage();

      default:
        return MapsPage();
    }
  }
}

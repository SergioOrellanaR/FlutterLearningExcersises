import 'package:flutter/material.dart';
import 'package:qr_reader_learning/src/pages/AddressesPage.dart';
import 'package:qr_reader_learning/src/pages/MapsPage.dart';
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _currentBottomBarIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage(_currentBottomBarIndex),
        bottomNavigationBar: _createBottomNavigationBar(),
        floatingActionButton: _floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,);
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQRTest,
        backgroundColor: Theme.of(context).primaryColor,);
  }

  // _scanQR() async
  // {

  //   //Scanned string = https://www.reddit.com/
  //   //Scanned geo    = geo:-33.50540437638074,-70.79436078509218

  //   String futureString = "";

  //   try
  //   {
  //     futureString = await BarcodeScanner.scan();
  //   }
  //   catch (e)
  //   {
  //     futureString = e.toString();
  //   }

  //   print(futureString);

  //   if(futureString != null)
  //   {
  //     print("trae información!");
  //   }
    
  // } 

  _scanQRTest() async
  {

    //Scanned string = https://www.reddit.com/
    //Scanned geo    = geo:-33.50540437638074,-70.79436078509218
    
    String futureString = "";

    
    
  }

  BottomNavigationBar _createBottomNavigationBar() 
  {
    return BottomNavigationBar(
      items: 
      [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text("Maps"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          title: Text("Addresses")
        )
      ],
      currentIndex: _currentBottomBarIndex,
      onTap: (value) {
        setState(() {
          _currentBottomBarIndex = value;
        });
      },
    );
  }

  _callPage( int actualPage ) 
  {
    switch( actualPage )
    {
      case 0:
        return MapsPage();
      
      case 1:
        return AdressesesPage();

      default:
        return MapsPage();
    }

  }
}
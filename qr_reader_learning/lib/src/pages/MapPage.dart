import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_learning/src/models/ScanModel.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final String _apiKey =
      "pk.eyJ1IjoiemVyb2NsIiwiYSI6ImNrNGhsMnMxeTEwbHYza21sOGNheGxoeXgifQ.Pd91Xjv6_01r8t6lB_Ru7A";
  MapController map = new MapController();
  String mapType = "streets";

  //Variables para manejar tipos de mapas
  List<String> mapas = ['streets', 'dark', 'light', 'outdoors', 'satellite'];
  int indexMap = 0;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenadas de mapa"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () => centerMap(scan),
          )
        ],
      ),
      body: _createFlutterMap(scan),
      floatingActionButton: _createFloatingActionButton(context),
    );
  }

  _createFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(center: scan.getLatLng(), zoom: 15),
      layers: [_createMap(), _createMarkers(scan)],
    );
  }

  LayerOptions _createMap() {
    return TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/v4/" +
            "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
        additionalOptions: {
          "accessToken": _apiKey,
          "id": "mapbox.$mapType", //streets. dark. light. outdoors, satellite
        });
  }

  MarkerLayerOptions _createMarkers(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          //Icono
          builder: (context) => Container(
                  child: Icon(
                Icons.location_on,
                size: 50.0,
                color: Theme.of(context).primaryColor,
              ))),
    ]);
  }

  centerMap(ScanModel scan) {
    map.move(scan.getLatLng(), 20.0);
  }

  _createFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.map),
      onPressed: changeMap,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void changeMap() {
      
      indexMap++;
      if (indexMap > mapas.length - 1) {
        indexMap = 0;
      }
  
      setState(() {
        mapType = mapas[indexMap];
      });
    }
}

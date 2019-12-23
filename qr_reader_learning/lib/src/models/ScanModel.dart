
import 'package:latlong/latlong.dart';

class ScanModel {
  int id;
  String type;
  String value;

  ScanModel({
    this.id,
    this.type,
    this.value,
  }) {
    if (value.contains("http")) {
      type = "http";
    } else {
      type = "geo";
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };

  LatLng getLatLng()
  {
    List<String> latlon = value.substring(4).split(",");
    double lat;
    double lon;
    try
    {
      lat = double.parse(latlon[0]);
      lon = double.parse(latlon[1]);
    }
    catch(e)
    {
      lat = 0.0;
      lon = 0.0;
    }
    
    return LatLng(lat,lon);
  }
  
  @override
  String toString() {
  return "Id: $id, Tipo: $type";
   }
}

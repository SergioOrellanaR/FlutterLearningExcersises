import 'package:flutter/material.dart';
import 'package:qr_reader_learning/src/bloc/ScansBloc.dart';
import 'package:qr_reader_learning/src/models/ScanModel.dart';
import 'package:qr_reader_learning/utils/utils.dart' as utils;

class AdressesesPage extends StatelessWidget {
  final scansBloc = new ScansBloc();


  @override
  Widget build(BuildContext context) {
    scansBloc.getScans();


    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {

        if (snapshot.hasData)
        {
          final scans = snapshot.data;
          if(scans.length == 0)
          {
            return Center(child: Text("No se ha encontrado información"),);
          }
          else
          {
            return ListView.builder(
              itemCount: scans.length,
              itemBuilder: (context, i) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) => scansBloc.deleteScans(scans[i].id),
                  background: Container(color: Colors.red,),
                  child: ListTile
                  (
                    leading: Icon(Icons.cloud_queue, color: (Theme.of(context).primaryColor),),
                    title: Text( scans[i].value),
                    subtitle: Text(scans[i].toString()),
                    trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                    onTap: () => utils.openScan(scans[i], context),
                  ),
              ),
            );
          }
        }
        else
        {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
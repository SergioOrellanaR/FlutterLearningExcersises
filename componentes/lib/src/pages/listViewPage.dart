import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10Images();
    _scrollController.addListener(() {
      double position = _scrollController.position.pixels;
      double maxScroll = _scrollController.position.maxScrollExtent;

      if (_reachedEndOfPage(position, maxScroll)) {
        // _add10Images();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    //_numberList = [];
    //_lastItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Listas")),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _callOnRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          String imageId = _numberList[index].toString();
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/id/$imageId/500/300"),
            placeholder: AssetImage("assets/GrayCat.gif"),
          );
        },
      ),
    );
  }

  void _add10Images() {
    for (int i = 0; i < 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

  bool _reachedEndOfPage(double positionPixels, double maxScrollExtent) {
    return positionPixels == maxScrollExtent;
  }

  Future<Timer> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    Duration duration = new Duration(seconds: 2);

    return new Timer(duration, _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 500));
    _add10Images();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/LoadingCat.gif"),
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      );
    } else {
      return Container();
    }
  }

  Future<void> _callOnRefresh() async
  {
    final duration = new Duration(seconds: 2);
    new Timer(duration, ()
    {
      _numberList.clear();
      _lastItem++;
      _add10Images();
    });

    return Future.delayed(duration);
  }
}

import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<Widget> _list = List<Widget>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
    // TODO: implement initState
    super.initState();
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() {
      _list.add(child);
    });
  }

  Widget _newItem(int i) {
    Key key = Key("item_${i}");
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10),
      child: Chip(
          label: Text("${i} Name Here"),
          deleteIconColor: Colors.red,
          deleteButtonTooltipMessage: "Delete",
          onDeleted: () =>
            _removeItem( key)
        ,
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text(i.toString()),
          )),
    );
    counter++;
    return child;
  }



  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() =>
          _list.removeAt(i));
          print("Removing  ${key.toString()}");

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Name Here"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onClicked,
          child: Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: _list,
            ),
          ),
        ));
  }
}

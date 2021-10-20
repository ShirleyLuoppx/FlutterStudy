import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/sevenday/MultiShower.dart';

/// 基础控件(下)+Flex布局详解

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: mainAxisAlignmentTest,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.black12,
        elevation: 12,
        highlightElevation: 24,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(
          Icons.add,
          size: 25,
          color: Colors.brown,
          semanticLabel: "hhaa",
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///
  /// 主轴方向：MainAxisAlignment
  ///
  var mainAxisAlignmentDirections = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly
  ];
  var mainAxisAlignmentTest = MultiShower(
    [MainAxisAlignment.start],
    (e) {
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: e,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Container(
            width: 30,
            height: 60,
            color: Colors.blue,
          ),
          Container(
            width: 70,
            height: 30,
            color: Colors.yellow,
          ),
          Container(
            width: 100,
            height: 60,
            color: Colors.green,
          )
        ],
      );
    },
    infos: [""],
    width: 500,
    height: 200,
  );

  ///
  /// 轴向：Axis
  ///
  var direction = [Axis.horizontal, Axis.horizontal];
  var show = MultiShower(
    [Axis.vertical],
    (e) {
      return Flex(
        direction: e,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
          Container(
            width: 30,
            height: 60,
            color: Colors.blue,
          ),
          Container(
            width: 70,
            height: 30,
            color: Colors.yellow,
          ),
          Container(
            width: 100,
            height: 60,
            color: Colors.green,
          )
        ],
      );
    },
    color: Colors.black,
    height: 300,
    width: 500,
    infos: [""],
  );

  var redContainer = Container(
    width: 50,
    height: 50,
    color: Colors.red,
  );
  var blueContainer = Container(
    width: 30,
    height: 60,
    color: Colors.blue,
  );
  var yellowContainer = Container(
    width: 70,
    height: 30,
    color: Colors.yellow,
  );
  var greenContainer = Container(
    width: 100,
    height: 60,
    color: Colors.green,
  );
}

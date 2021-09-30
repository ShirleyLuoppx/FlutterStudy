import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Flutter电子书demo

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //BoxDecoration:控制背景颜色；Scaffold有一个默认的白色背景色和默认的黑色字体色，
      //如果没用scaffold的话，就是一个默认黑色的背景和字体颜色，所以需要自己配置
      decoration: new BoxDecoration(color: Colors.white),
      child: new Center(
        child: new Text(
          "hello6660000000000000000",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 40, color: Colors.black87),
          maxLines: 1,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("hello ppx")),
      body: new Center(
          child: new Text(
            "Hello 000",
            style: new TextStyle(fontSize: 32.0),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

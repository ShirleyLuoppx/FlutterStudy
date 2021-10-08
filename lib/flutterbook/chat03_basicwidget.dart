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
      // child: new Center(
      child: new Text(
        "hello6660000000000000000",
        textDirection: TextDirection.ltr,
        maxLines: 1,
        textAlign: TextAlign.end,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1.5,

        //字体样式
        style: new TextStyle(
            color: Colors.pink,
            //fontSize同textScaleFactor一样，用于设置字体大小，不同的是：fontSize不随系统字体大小改变，textScaleFactor跟随系统字体大小改变
            fontSize: 30.0,
            height: 1.2,
            fontFamily: "Courier",
            background: Paint()..color = Colors.yellow,
            //下划线
            decoration: TextDecoration.underline,
            //下划线是虚线，默认是实线
            decorationStyle: TextDecorationStyle.dashed),
      ),
      // ),
    );
  }

}

class TextSpanClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();

    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Text.rich(TextSpan(children: [
        TextSpan(text: "HOME"),
        TextSpan(text: "https://xxx.com", style: TextStyle(color: Colors.blue))
      ])),
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


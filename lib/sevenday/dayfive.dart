import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 布局实例+操作交互

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
      body: test3Fun(),
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

  //布局栗子4


  //布局栗子3
  test3Fun() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(2, 20, 5, 20),
            child: headImg,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: centerContent,
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: iconsRow,
          ),
        ],
      ),
    );
  }

  var headImg = Container(
    child: Image.asset("images/headimg.png"),
    width: 90,
    height: 90,
  );

  var centerContent = Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "张风捷特烈",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.shopping_bag_sharp),
              ),
              Text(
                "万花过尽知无物",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(" | "),
              Text(
                "编程之王",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.perm_identity),
              ),
              Text(
                "海的彼岸有我未曾见证的风采",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        )
      ],
    ),
  );

  var iconsRow = Column(
    children: [
      Row(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset("images/weibo.png"),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset("images/github.png"),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset("images/earth.png"),
        ),
      ]),
      Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
          child: Text(
            "已关注",
            style: TextStyle(fontSize: 20, color: Colors.white,),
          ),
          width: 110,
          height: 40,
          color: Colors.green,
          alignment: Alignment.center,
        ),
      )
    ],
  );

  //布局栗子2
  test2Fun() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            "images/panda.png",
            width: 50,
            height: 50,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "点绛唇",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: Text(
                  "溪壑分离，红尘游戏，真何趣？名利犹虚，后事终难继",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "昨天",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  //布局栗子1
  var rowLine = Row(
    children: <Widget>[
      Icon(
        Icons.extension,
        color: Colors.blue,
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          "好友微视",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      )),
      Icon(Icons.arrow_forward)
    ],
  );

  test1Fun() {
    return Container(
      child: rowLine,
      padding: EdgeInsets.all(10),
      color: Colors.white,
    );
  }

  //封装一个生成背景色块的方法
  Container getBackGroundColor(Widget w, [Color? color]) {
    return Container(
      child: w,
      color: color ?? getColor(),
    );
  }

  Color getColor() {
    Random random = Random();
    int a = random.nextInt(200) + 30;
    int r = random.nextInt(200) + 30;
    int g = random.nextInt(200) + 30;
    int b = random.nextInt(200) + 50;
    return Color.fromARGB(a, r, g, b);
  }
}

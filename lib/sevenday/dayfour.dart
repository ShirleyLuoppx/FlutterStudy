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
      body: textBaseLineFun(),
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
  /// textBaseLine：基线对齐方式（乍一看 确实看不出区别的..）
  ///
  var textBaseLine = [TextBaseline.alphabetic, TextBaseline.ideographic];
  var redText = Text(
    "hello",
    style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
  );
  var blueText = Text(
    "convenient",
    style: TextStyle(fontSize: 30, backgroundColor: Colors.blue),
  );
  var greenText = Text(
    "Flutter",
    style: TextStyle(fontSize: 10, backgroundColor: Colors.green),
  );

  textBaseLineFun() {
    return MultiShower(
      [TextBaseline.alphabetic],
      (e) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            redText,
            blueText,
            greenText,
          ],
        );
      },
      infos: [""],
      width: 300,
      height: 500,
      color: Colors.black,
    );
  }

  ///
  /// verticalDirection：竖直方向排序
  ///
  var verticalDirections = [
    //从上往下
    VerticalDirection.down,
    //下往上
    VerticalDirection.up
  ];

  verticalDirectionFun() {
    return MultiShower(
      [VerticalDirection.down],
      (e) {
        return Flex(
          direction: Axis.vertical,
          verticalDirection: e,
          children: [
            redContainer,
            blueContainer,
            yellowContainer,
            greenContainer
          ],
        );
      },
      infos: [""],
      height: 300,
      width: 500,
      color: Colors.black,
    );
  }

  ///
  /// textDirection：文字方向
  ///
  var textDirection = [
    //从左到右
    TextDirection.ltr,
    //右到左
    TextDirection.rtl
  ];

  textDirectionFun() {
    return MultiShower(
      [TextDirection.rtl],
      (e) {
        return Flex(
          direction: Axis.horizontal,
          textDirection: e,
          children: [
            redContainer,
            blueContainer,
            yellowContainer,
            greenContainer
          ],
        );
      },
      infos: [""],
      width: 300,
      height: 500,
      color: Colors.white,
    );
  }

  ///
  /// mainAxisSize：主轴方向
  ///
  var mainAxisSize = [
    //仅包裹自己就行，相当于android的wrap_content
    MainAxisSize.min,
    //当父容器的宽高未指定，Flex默认会将自身尽可能的延申，相当于android的match_parent
    MainAxisSize.max
  ];

  mainAxisSizeFun() {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: [
          yellowContainer,
          greenContainer,
          blueContainer,
          redContainer
        ],
      ),
    );
  }

  ///
  /// CrossAxisAlignment 交叉轴方向(竖直轴方向)
  ///
  var crossAxisAlignmentType = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
    //交叉轴方向为baseline的时候，Flex必须包含textBaseline这个参数哟
    CrossAxisAlignment.baseline
  ];

  crossAxisAlignmentFun() {
    return MultiShower(
      [CrossAxisAlignment.baseline],
      (e) {
        return Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: e,
          textBaseline: TextBaseline.alphabetic, //基线类型。看起来两个值没啥区别
          children: [
            redContainer,
            blueContainer,
            greenContainer,
            yellowContainer
          ],
        );
      },
      infos: [""],
      width: 300,
      height: 500,
    );
  }

  ///
  /// 主轴方向：MainAxisAlignment
  ///
  var mainAxisAlignmentDirections = [
    //主轴水平顶头
    MainAxisAlignment.start,
    //内容居中
    MainAxisAlignment.center,
    //内容接尾
    MainAxisAlignment.end,
    //顶头接尾，其他均分
    MainAxisAlignment.spaceBetween,
    //中间均分，两边空一半
    MainAxisAlignment.spaceAround,
    //均分
    MainAxisAlignment.spaceEvenly
  ];

  mainAxisAlignmentFun() {
    return MultiShower(
      [MainAxisAlignment.spaceEvenly],
      (e) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: e,
          children: <Widget>[
            redContainer,
            blueContainer,
            yellowContainer,
            greenContainer
          ],
        );
      },
      infos: [""],
      width: 500,
      height: 200,
    );
  }

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

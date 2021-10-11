import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///基础控件

void main() {
  runApp(new MyApp());
}

//
void materialAppTest() {
  MaterialApp(
    title: "this is MaterialApp's title",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: Scaffold(
      appBar: AppBar(
        title: Text("this is AppBar's title widget"),
        backgroundColor: Colors.pink,
        //toolbar背景色
        elevation: 12,
        //阴影
        centerTitle: true,
        //是否标题居中
        toolbarOpacity: 0.5, //toolbar透明度
      ),
    ),
  );
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
      body: combineContainerPaddingTest,
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

  ///Row  行
  ///横向排列，如果内容超出一行会有一个黄色斜条纹提示
  var rowTest = Row(
    children: <Widget>[
      Text("雕栏玉砌应犹在，"),
      Text("只是朱颜改。"),
      Text("问君能有几多愁，"),
      Text("恰似一江春水向东流。")
    ],
  );

  ///Column  列
  var columnTest = Column(
    children: <Widget>[
      Text("雕栏玉砌应犹在，"),
      Text("只是朱颜改。"),
      Text("问君能有几多愁，"),
      Text("恰似一江春水向东流。")
    ],
  );

  ///Expanded  就是让内容扩展到均匀铺满当前 行/列
  var expandedTest = Row(
    children: <Widget>[
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，"))
    ],
  );

  var expandedTest1 = Column(
    children: <Widget>[
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，")),
      Expanded(child: Text("雕栏玉砌应犹在，"))
    ],
  );

  ///Container--容器
  //普通容器
  var containerTest = new Container(
    child: Text("this is  a Container Widget"),
    color: Colors.white,
    width: 200,
    height: 200,
    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
    padding: EdgeInsets.all(20),
  );

  //居中容器
  var centerContainerTest = new Center(
    child: Text("this is a Center Container Test "),
    heightFactor: 200,
    widthFactor: 200,
  );

  //Padding容器，padding参数必传
  var paddingContainerTest = new Padding(
    padding: EdgeInsets.all(20),
    child: Text("this is a Padding Container Test"),
  );

  //混合容器：Container+Center
  var combineContainerCenterTest = new Container(
    color: Colors.limeAccent,
    width: 300,
    height: 300,
    child: Center(
      child: Text("this is a combine container with Container and Center"),
    ),
  );

  //混合容器：Container+Padding
  var combineContainerPaddingTest = new Container(
    color: Colors.purpleAccent,
    width: 300,
    height: 300,
    child: Padding(
      padding: EdgeInsets.all(10),
      child:
          Text("this is a combine container with Container and Padding widget"),
    ),
  );

  var stack = new Stack();
}

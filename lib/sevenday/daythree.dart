import 'dart:math';

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
      body: new Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.start,
        // 列间距
        spacing: 8.0,
        //行间距
        runSpacing: 4.0,
        //child的对齐方式
        crossAxisAlignment: WrapCrossAlignment.center,
        children: formColorList(60),
      ),
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

  /// ---------------------------------------------------基础控件三大战力（Table、Flow、Wrap）start--------------------------------------

  //Wrap 包裹
  // var wrap = new Wrap(
  //   direction: Axis.horizontal,
  //   alignment: WrapAlignment.center,
  //   spacing: 8.0,
  //   // 列间距
  //   runSpacing: 4.0,
  //   //行间距
  //   crossAxisAlignment: WrapCrossAlignment.center,
  //   children: formColorList(50),
  // );

  //Flow  流动容器
  var li = <Widget>[];

  formColorList(int count) {
    li.clear();
    var random = new Random();

    for (int i = 0; i < count; i++) {
      li.add(new Container(
        width: 100 * (random.nextDouble() + 0.3),
        height: 30,
        color: Color.fromARGB(random.nextInt(999), random.nextInt(888),
            random.nextInt(777), random.nextInt(777)),
      ));
    }
    return li;
  }

  // var flowTest = Flow(
  // delegate: MarginFlowDelegate(EdgeInsets.all(5)),
  // children: formColorList(60))

  //Table 表格
  var tableTest = new Table(
    columnWidths: const <int, TableColumnWidth>{
      0: FixedColumnWidth(80.0),
      1: FixedColumnWidth(60.0),
      2: FixedColumnWidth(100.0),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    border: TableBorder.all(
        color: Colors.greenAccent, style: BorderStyle.solid, width: 1.0),
    children: const <TableRow>[
      TableRow(children: <Widget>[
        Center(child: Text("姓名")),
        Center(child: Text("类型")),
        Center(child: Text("分路")),
      ]),
      TableRow(children: <Widget>[
        Text(
          "瑶妹",
          style: TextStyle(wordSpacing: 10),
          textAlign: TextAlign.center,
        ),
        Text("辅助"),
        Text("游走支援")
      ]),
      TableRow(children: <Widget>[
        Center(child: Text("李元芳")),
        Center(child: Text("射手")),
        Center(child: Text("发育路")),
      ]),
      TableRow(children: <Widget>[
        Center(child: Text("甄姬")),
        Center(child: Text("法师")),
        Center(child: Text("中路")),
      ]),
      TableRow(children: <Widget>[
        Center(child: Text("孙策")),
        Center(child: Text("坦克")),
        Center(child: Text("对抗路")),
      ]),
      TableRow(children: <Widget>[
        Center(child: Text("宫本武藏")),
        Center(child: Text("刺客")),
        Center(child: Text("打野游走支援")),
      ])
    ],
  );

  /// ---------------------------------------------------基础控件三大战力（Table、Flow、Wrap）end--------------------------------------

  /// ---------------------------------------------------基础控件start--------------------------------------
  //Offstage，控制显隐容器：控制部件显隐的部件。true：隐藏；false：显示
  var offStageTest = new Container(
    color: Colors.black,
    width: 300,
    height: 300,
    child: Offstage(
      offstage: true,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          "容易莫摧残",
          style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    ),
  );

  //Transform，变换容器：包含平移，旋转和缩放
  var transform = new Transform(
    transform: Matrix4.translationValues(100, 100, 0),
    child: Container(
      color: Colors.brown,
      width: 300,
      height: 100,
      child: Text("逆风如解意"),
    ),
    //transform的偏移量，不设置的话就是从屏幕左上角的位置开始transform，设置后就是从设置的点开始transform
    origin: Offset(0, 100),
  );

  //IndexedStack  索引堆叠容器：按照index来显示堆叠的部件，同时只能显示一个部件
  var indexedStackContainerTest = new Container(
    color: Colors.green,
    width: 300,
    height: 300,
    child: IndexedStack(
      index: 3,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Card(
            elevation: 10,
            color: Colors.grey,
            child: Text("秋夕"),
          ),
        ),
        Text("银烛秋光冷画屏，"),
        Text("轻罗小扇扑流萤。"),
        Text("天阶夜色凉如水，"),
        Text("坐看牛郎织女星。"),
      ],
    ),
  );

  ///Stack
  //Stack像FrameLayout一样会布局重叠
  //感觉Flutter的布局像是在套娃，一直children、child的..爷爷套爸爸，爸爸套儿子，儿子套孙子
  var stackContainerTest = new Container(
    color: Color.fromARGB(96, 70, 9, 199),
    width: 300,
    height: 300,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Text("去年今日此门中，"),
        Align(
          alignment: Alignment.topRight,
          widthFactor: 1,
          child: Card(
            elevation: 10,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text("题都城南庄"),
            color: Color(0xffffffff),
          ),
        ),
        Text("人面桃花相映红。"),
        Text("人面不知何处去，"),
        Text("桃花依旧笑春风。"),
      ],
    ),
  );

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

  /// ---------------------------------------------------基础控件end--------------------------------------
}

///添加一个FlowDelegate的实现类
class MarginFlowDelegate extends FlowDelegate {
  EdgeInsets _margin = EdgeInsets.zero; //成员变量_margin
  MarginFlowDelegate(this._margin); //构造函数
  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    var offsetX = _margin.left;
    var offsetY = _margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + offsetX + _margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = w + _margin.left;
      } else {
        offsetX = _margin.left;
        offsetY +=
            context.getChildSize(i)!.height + _margin.top + _margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX +=
            context.getChildSize(i)!.width + _margin.left + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    throw UnimplementedError();
  }
}

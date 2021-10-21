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
      body: test1Fun(),
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

  //布局demo
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
}

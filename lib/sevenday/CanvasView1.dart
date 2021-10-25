//Canvas绘版
import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: new CanvasPage(key: Key(""), title: 'Flutter Demo Home Page'),
    );
  }
}

class CanvasView extends CustomPainter {
  BuildContext context;
  late Paint mPaint;
  double _downX;
  double _downY;
  double _upX;
  double _upY;

  CanvasView(this.context, this._downX, this._downY, this._upX, this._upY) {
    mPaint = new Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    // drawGrid(canvas, winSize);
    print("_downX:$_downX,_downY:$_downY");
    canvas.drawLine(Offset(_downX, _downY), Offset(_upX, _upY), mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class CanvasPage extends StatefulWidget {
  CanvasPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  var _downX = 0.0;
  var _downY = 0.0;
  var _upX = 0.0;
  var _upY = 0.0;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("张风捷特烈"),
    );
    var barTopHeight = MediaQueryData.fromWindow(window).padding.top;

    var scf = Scaffold(
        appBar: appBar,
        body: CustomPaint(
          painter: CanvasView(context, _downX, _downY, _upX, _upY),
        ));

    return GestureDetector(
      child: scf,
      onPanDown: (d) {
        _downX = d.globalPosition.dx;
        _downY =
            d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
      },
      onPanUpdate: (d) {
        _upX = d.globalPosition.dx;
        _upY = d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
        setState(() {});
      },
      onPanEnd: (d) {
        _downX = -10.0;
        _downY = -10.0;
        _upX = -10.0;
        _upY = -10.0;
        setState(() {});
      },
    );
  }
}

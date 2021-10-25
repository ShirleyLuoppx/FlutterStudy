import 'dart:math';
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

/// 交互栗子
//小球数据承载类
class Draw {
  double x;
  double y;
  Color color;

  Draw(this.x, this.y, this.color);
}

//Canvas绘版
class CanvasView extends CustomPainter {
  BuildContext context;
  late Paint mPaint;

  CanvasView(this.context) {
    mPaint = new Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    balls.forEach((ball) {
      drawBall(canvas, ball);
    });
    var winSize = MediaQuery.of(context).size;
    // drawGrid(canvas, winSize);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  //绘制小球
  void drawBall(Canvas canvas, Draw ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), 10, mPaint);
  }
}

var balls = []; //小球合集

class CanvasPage extends StatefulWidget {
  CanvasPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text("张风捷特烈"),
    );
    var barTopHeight = MediaQueryData.fromWindow(window).padding.top;
    print(barTopHeight);

    var scf = Scaffold(
        appBar: appBar,
        body: CustomPaint(
          painter: CanvasView(context),
        ));

    var random = Random();

    return GestureDetector(
      child: scf,
      onTapDown: (d) {
        var pos = d.globalPosition;
        balls.add(new Draw(
            pos.dx,
            pos.dy - appBar.preferredSize.height - barTopHeight,
            Color.fromARGB(random.nextInt(999), random.nextInt(888),
                random.nextInt(777), random.nextInt(777))));
        print(balls.length);
        setState(() {});
      },
      onPanUpdate: (d) {
        var pos = d.globalPosition;
        balls.add(new Draw(
            pos.dx,
            pos.dy - appBar.preferredSize.height - barTopHeight,
            Color.fromARGB(random.nextInt(999), random.nextInt(888),
                random.nextInt(777), random.nextInt(777))));
      }
    );
  }
}

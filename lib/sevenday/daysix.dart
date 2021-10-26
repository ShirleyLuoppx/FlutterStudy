import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

//异步-IO+网络访问+json

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // readFileOk();
  writeString(name);
  readString();
  print("叫你一声你可敢答应？");
}

// copyFile() async {
//   final audioFile = await rootBundle.load('assets/audio/intro.mp3');
//   final dir = await getApplicationDocumentsDirectory();
//   File file = File('${dir.path}/audio/intro.mp3');
//
//   await file.writeAsBytes(audioFile.buffer.asUint8List());
//   url = file.path;
// }

//await + async 读取文件
String name = "Jimi";
/// 获取文档目录文件
Future<File> _getLocalDocumentFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/str.txt');
}

/// 获取临时目录文件
Future<File> _getLocalTemporaryFile() async {
  final dir = await getTemporaryDirectory();
  return File('${dir.path}/str.txt');
}

/// 获取应用程序目录文件
Future<File> _getLocalSupportFile() async {
  final dir = await getApplicationSupportDirectory();
  return File('${dir.path}/str.txt');
}

/// 读取值
/// warning: LF will be replaced by CRLF in pubspec.lock.
// The file will have its original line endings in your working directory
Future<void> readString() async {
  try {

    final file = await _getLocalDocumentFile();
    final result  = await file.readAsString();
    print("result-----$result");

    final file1 = await _getLocalTemporaryFile();
    final result1  = await file1.readAsString();
    print("result1-----$result1");

    final file2 = await _getLocalSupportFile();
    final result2  = await file2.readAsString();
    print("result2-----$result2");


  } catch (e) {
  }
}

/// 写入数据
Future<void> writeString(String str) async {
  final file = await _getLocalDocumentFile();
  await file.writeAsString(name);

  final file1 = await _getLocalTemporaryFile();
  await file1.writeAsString(name);

  final file2 = await _getLocalSupportFile();
  await file2.writeAsString(name);
  print("写入成功");
}

readFile(name) {
  var file = File(name);
  return file.readAsString();
}

readFileOk() async {
  var result = await readFile(r"C:\Users\WTCL\Desktop\poem.txt");
  print(result);
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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

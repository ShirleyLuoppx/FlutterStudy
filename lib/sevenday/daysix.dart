import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

//异步-IO+网络访问+json

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // // readFileOk();
  // writeString(name);
  // readString();
  // print("叫你一声你可敢答应？");

  // IOFun();
  _takePicture();
}

///-------------------------File和Directory的常见api--------------///
fileAndDirectoryFun() {
  Directory(r'C:\Users\WTCL\Desktop\dart\test').createSync(recursive: true);
}

Future<File> _takePicture() async {
  Directory root = await getTemporaryDirectory(); // this is using path_provider
  String directoryPath = '${root.path}/bozzetto_camera';
  await Directory(directoryPath).create(recursive: true); // the error because of this line
  String filePath = '$directoryPath/${DateTime.now()}.jpg';
  // try {
  //   await _cameraController.takePicture(filePath);
  // } catch (e) {
  //   return null;
  // }
  return File(filePath);
}


///-------------------Dart中的IO操作-----------------------------------------///
IOFun() async {
  var uri = 'file:///C:/Users/WTCL/Desktop/test.json';
  Uri uriBase = Uri.base;
  //file:///
  print(uriBase);

  var uriParse = Uri.parse("file:///C:/Users/WTCL/Desktop/test.json");
  //----------------------------------0--/C:/Users/WTCL/Desktop/test.json------------------------------null
  print(
      "${uriParse.host}--${uriParse.port}--${uriParse.path}--${uriParse.query}--${uriParse.fragment}--${uriParse.data}");

  Uri uriHttp = new Uri.http("", "file:///C:/Users/WTCL/Desktop/test.json");
  //http
  print('scheme:====' + uriHttp.scheme);

  //会报错，因为File.fromUri(uri);只能传入一个File相关的uri，类似：file://....，而Uri.http是一个http的，所以会报错
  // File file =
  //     File.fromUri(new Uri.http("", "file:///C:/Users/WTCL/Desktop/test.json"));
  // print(file);

  File fileFromUri = File.fromUri(uriParse);
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/test.json');
  // print('fileFromUri data:' + fileFromUri.readAsString().toString());

  // Future<File> _getLocalDocumentFile() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   return File('${dir.path}/str.txt');
  // }
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
    final result = await file.readAsString();
    print("result-----$result");

    final file1 = await _getLocalTemporaryFile();
    final result1 = await file1.readAsString();
    print("result1-----$result1");

    final file2 = await _getLocalSupportFile();
    final result2 = await file2.readAsString();
    print("result2-----$result2");
  } catch (e) {}
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

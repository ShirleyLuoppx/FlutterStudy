import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  test();
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}

var name = "hello ppx";
int age = 12;

//任何类型
dynamic a = "";
dynamic b = 1;

//普通函数
String lookUpVersion() => '1.0.0';

//异步函数
Future<String> lookUpVersion1() async => '1.0.0';

//使用final定义一个变量（不能被改变的变量，也就是常量拉）
final name1 = "jikajd";
final String projectName = "english";

//使用const定义一个变量，如果const是类级别的 ，需要加static
const bagColor = "riceWhite";
const number = 1;

//方法级别的const变量
void test() {
  const phoneNumber = "110120";

  //字符串转int，其他几个类型类似
  int number = int.parse('1');
  assert(number == 1);

  //dart变量支持 普通的=-*/ 和位运算符 <<  >> | &
  assert(3 << 1 == 6);

  List list = [1, 2, 3, 4];
  List list1 = ["a", "b", "c", "d", "e"];
  //可推断类型
  var list2 = [6.6, 6.6, 6.6];

  var constantList = const [1, 2, 3];
  // constantList[1] = 1;

  //Set集合，可推断类型
  var setList = {'name', 'age', 'score'};
  setList.add("0");

  Set<int> setList1 = {1, 2, 3};

  //Set集合
  var namesMap = {"jerry", "peter", "rose", "jennie", "lisa"};
  namesMap.add("value");

  //Set集合
  var addSetList = <String>{};
  addSetList.add('sex');
  addSetList.addAll(setList);
  assert(addSetList.length == 4);

  //Map
  var mapList = {"name": "list", "sex": "girl", "goodat": "dance and sing"};
  var mapList1 = {1: 1, 2: 2};

  //在dart2 中new 关键字可省
  var map = Map();
  map["key"] = "value";

  //也可以new Map
  var map1 = new Map();
  map1["key"] = "value";

//可选参数分为，命名可选参数和位置可选参数
//命名可选参数，调用时（就是普通认知里面的调用而已）
  testFun(true, true);
  //命名可选参数，定义时（也是普通认知里面的定义而已）
  void testFun2(bool a) {}

  //位置可选参数，定义时用[]包起来就是
  //定义位置可选参数的时候，有一个非空判断 ，要么给位置可选参数的类型后面加上问号，定义成可空变量；
  // 要么在参[]前面加上注释@required ，定义成必须可选参数。
  // 但是这样的话感觉这个可选参数都没有意义了,,既然是必选那何必加在[]里面呢
  // ignore: invalid_required_positional_param
  void testFun3(bool a, [String? device]) {}
  //调用位置可选参数
  testFun3(true, "666");

  void testFun4(bool a, [bool? b]) {}
  //调用位置可选参数
  testFun4(true);
  testFun4(true, false);
}

//定义方法参数
void testFun(bool isResult, bool isSuccess) {}

//也可以省略类型声明，依旧可以正常使用
testFun1(isResult, isSuccess) {}

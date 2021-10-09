void main() {
  int a = 10;
  print("------${a / 3}");
  print('-----${a ~/ 3}'); //   ~/的结果是整形

  int b = 9;
  b = 5;
  b ??= a; //----如果b空的则赋值
  print(b); //5

  int c = 10;
  int d = 8;
  var add10 = c = null ?? d + 10; // 将null赋值给c，所以第一个表达式为空，返回第二个表达式
  print(add10); //18
  // expr1 ?? expr2
  //     如果 expr1 是 non-null， 返回 expr1 的值； 否则, 执行并返回 expr2 的值。

  Person person = new Person("Lisa", 1);
  person.say();

  new Student("laLisa", 24, "史莱克学院").say();
}

class Student extends Person {
  String school;

  Student(String name, int age, this.school) : super(name, age);
}

class Person {
  String name;
  int age;

  //只有这里跟java类不一样其他都是一样的
  Person(this.name, this.age);

  void say() {
    print('hello this is my friend $name and she is $age');
  }
}

void baseUse() {
  var list = [1, "a", "b", "c", true]; //支持多种类型
  //  var list=const[1,"a","b","c",true];
  //  var list =new List();

  list[0] = "10"; //数组元素可修改成不同类型
  var el = list[list.length - 1]; //获取--true
  list.add("toly"); //尾增--[10, a, b, c, true, toly]
  list.insert(1, true); //定点增--[10, true, a, b, c, true, toly]
  list.remove("10"); //删除元素--[true, a, b, c, true, toly]
  list.indexOf(true); //首出索引--1
  list.lastIndexOf(true); //尾出索引--4
  list.removeLast(); //移除尾--[true, a, b, c, true]
  print(list.sublist(2)); //截取--[b, c, true]
  print(list.sublist(2, 4)); //截取--[b, c]
  print(list);
  print(list.join("!")); //true!a!b!c!true
}

void op() {
  var numList = [3, 2, 1, 4, 5];
  numList.sort();
  print(numList); //排序--[1, 2, 3, 4, 5]

  for (var value in numList) {
    print(value); //1,2,3,4,5
  }

  numList.forEach(addOne); //2,3,4,5,6
  numList.forEach((num) => print(num + 1)); //同上

  var any = numList.any((num) => num > 3);
  print(any); //只要有>3的任何元素,返回true

  var every = numList.every((num) => num < 6);
  print(every); //全部元素<6,返回true

  var listX5 = numList.map((e) => e *= 5);
  print(listX5); //(5, 10, 15, 20, 25)
}

void addOne(int num) {
  print(num + 1);
}

void mapBaseUse() {
  //创建映射表
  var dict = {"a": "page1", "b": "page30", "c": "page70", "price": 40};
//  var dict = new Map();
  print(dict); //{a: page1, b: page30, c: page70, price: 40}
  print(dict["price"]); //40
  dict["a"] = "page2";
  print(dict); //{a: page2, b: page30, c: page70, price: 40}
  print(dict.containsKey("price")); //true
  print(dict.containsValue("price")); //false
  print(dict.isEmpty); //false
  print(dict.isNotEmpty); //true
  print(dict.length); //4
  dict.remove("c");
  print(dict); //{a: page2, b: page30, price: 40}
}

void mapOp() {
  var dict = {"a": "page1", "b": "page30", "c": "page70", "price": 40};
  dict.keys.forEach(print); //a,b,c,price
  dict.values.forEach(print); //a,b,c,price
  dict.forEach((k, v) => (print("$k=$v"))); //这里用括号包着，好想吐槽...
}

void dynamicTest() {
  dynamic d = 20;
  d = "toly";

  var list = <dynamic>[];
  list.add("1");
  list.add(3);

  // var list2 = new List<int>();
  //list2.add("toly");//ERROR:The argument type 'String' can't be assigned to the parameter type 'int'.
}

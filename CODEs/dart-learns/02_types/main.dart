import 'dart:math';

typedef IntList = List<int>;

void main(List<String> args) {
  /// 1. Numbers
  int x = 10;
  double PI = 3.14;
  num score = 80;
  score = 90.5;
  print('$x, $PI, $score');

  // -- 计算函数
  print(3.14.ceil());
  print(3.14.floor());
  print(-1.abs());
  print(sqrt(4));
  print(pow(2, 2));

  // -- 数值转换
  // String -> int
  int.parse('1');

  // String -> double
  double.parse('1.1');

  // int -> String
  1.toString();

  // double -> String
  3.14159.toStringAsFixed(2);

  // 2. Strings

  'Single quotes work well for string literals.';
  "Double quotes work just as well.";
  'It\'s easy to escape the string delimiter.';
  "It's even easier to use the other delimiter.";

  var country = 'china';
  var age = 30;
  print('I\'m come from ${country.toUpperCase()}!, and i am $age years old.');

  var firstName = 'San';
  var lastName = 'Zhang';
  var fullName = firstName + lastName;
  print(fullName);

  print(r'In a raw string, not even \n gets special treatment.');
  print('China'.length);
  print(''.isEmpty);
  print(''.isNotEmpty);
  print('I love china'.contains('china'));

  print('ABCDE'.substring(1, 2));
  print('ABCDE'.substring(2));

  print('China'.toLowerCase());
  print('China'.toUpperCase());

  print('C.h.i.n.a'.replaceAll('.', ''));

  List<String> letters = 'Apple,Orange,Banana'.split(',');
  print(letters);

  // 3. Records

  // -- 定义
  var infos = ('李鸿耀', '15888888888', 30);

  // -- 访问
  print('''
  姓名：${infos.$1}
  电话：${infos.$2}
  年龄：${infos.$3}
  ''');

  // -- 命名
  var dog = (name: '大黄', color: '黄色');
  print('${dog.name} - ${dog.color}');

  // -- 解构
  var (min, max) = (60, 90);
  print('min = $min, max = $max');

  // 4. Collections

  // 4.1. List
  var nums = [1, 2, 3, 4, 5];

  print(nums);
  print(nums[2]);
  print(nums.length);
  print(nums.isEmpty);
  print(nums.first);
  print(nums.last);
  print(nums.reversed);
  print(nums.where((n) => n % 2 == 0));
  print(nums.join('.'));

  // 4.2. Sets

  // -- 创建空的集合
  var names1 = <String>{};
  Set<String> names2 = {};

  Set<int> nums1 = {1, 2, 3};
  Set<int> nums2 = {3, 4, 5};
  print(nums1.length);
  print(nums1.isEmpty);
  print(nums1.contains(2));
  print(nums1.union(nums2));
  print(nums1.difference(nums2));
  print(nums1.intersection(nums2));

  // 4.3. Maps

  var tonics = {
    'bpm': 60,
    'keySignature': 'C-major',
    'timeSignature': '4/4',
  };
  print(tonics['bpm']);

  tonics['title'] = '夜曲';
  print(tonics);

  // 4.4. Operators
  var song = {...tonics, 'parts': []};
  print(song);

  // 5. Typedefs
  IntList int_list = [1, 2, 3];
  print(int_list);
}

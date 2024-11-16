// -- 无返回值函数
import 'dart:math';

void sayHello() {
  print('Hello');
}

// -- 有回值的函数
int getAge() {
  return 30;
}

// -- 变量函数（匿名函数）
var sayHi = () {
  print('Hi');
};

// -- 箭头函数
int sum(int a, int b) => a + b;

void login({String? account, String? password, bool? check}) {
  print('$account, $password, $check');
}

void processTicket(int count, Function onComplete) {
  Future.delayed(Duration(seconds: 1), () {
    onComplete();
  });
}

// -- 顶层函数/入口函数
void main(List<String> args) {
  print(args);

  // -- 调用函数
  sayHello();
  getAge();
  sayHi();
  print(sum(10, 20));

  // -- 立即执行函数
  ((int n) {
    print(sqrt(n));
  })(16);

  login(password: '111', account: 'tadmin');
  processTicket(1, () {
    print('已完成');
  });

  Function closures(int n) {
    return (int m) => m + n;
  }

  var fn = closures(10);
  print(fn(1));
  print(fn(5));

  Future<String> fetchData() {
    return Future.delayed(Duration(seconds: 2), () => 'Data loaded');
  }
  fetchData();
}

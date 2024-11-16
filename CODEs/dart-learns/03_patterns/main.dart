// 1. switch 表达式中的模式匹配
void describeShape(Object shape) {
  switch (shape) {
    case Circle(radius: var r):
      print('Circle with radius $r');
      break;
    case Rectangle(width: var w, height: var h):
      print('Rectangle with width $w and height $h');
      break;
    default:
      print('Unknown shape');
  }
}
class Circle {
  final double radius;
  Circle(this.radius);
}
class Rectangle {
  final double width;
  final double height;
  Rectangle(this.width, this.height);
}



void main() {
  describeShape(Circle(5));
  describeShape(Rectangle(3, 4));
}
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row'),
      ),
      body: Center(
        child: Row(
          // -- 主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // -- 交叉轴对齐方式
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.pink,
            ),
            Container(
              width: 100,
              height: 200,
              color: Colors.pink,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(8),
          color: Colors.black,
          child: const Text(
            '人生得意须尽欢，莫使金樽空对月。',
            // -- 文本对齐方式
            textAlign: TextAlign.left,
            // -- 最大行数
            maxLines: 1,
            // -- 文本溢出
            overflow: TextOverflow.ellipsis,
            // -- 文本样式
            style: TextStyle(
              // -- 字体颜色
              color: Colors.white,
              // -- 设置行高
              height: 1.5,
              // -- 字体大小
              fontSize: 20,
              // -- 字体粗细
              fontWeight: FontWeight.bold,
              // -- 字体名称
              fontFamily: 'LiuJianMaoCao',
              // -- 字符间距
              letterSpacing: 2,
              // -- 文本装饰线
              decoration: TextDecoration.underline,
              // -- 文本装饰线颜色
              decorationColor: Colors.white,
              // -- 文本装饰线风格
              decorationStyle: TextDecorationStyle.solid,
              // -- 文本装饰线粗细
              decorationThickness: 1,
            ),
          ),
        ),
      ),
    );
  }
}

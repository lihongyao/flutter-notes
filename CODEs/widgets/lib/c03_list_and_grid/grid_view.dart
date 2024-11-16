import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网格视图'),
      ),
      // body: const Basic(),
      // body: const Extent(),
      // body: const Builder(),
      body: const MixedList(),
    );
  }
}

/// 基础用法
class Basic extends StatelessWidget {
  const Basic({super.key});

  @override
  Widget build(BuildContext context) {
    var random = Random();
    return GridView.count(
      // -- 指定每行显示的列数
      crossAxisCount: 2,
      // -- 控制网格滚动的方向
      scrollDirection: Axis.vertical,
      // -- 是否颠倒滚动方向
      reverse: false,
      // -- 控制滚动的物理效果，比如弹性、惯性等
      physics: const BouncingScrollPhysics(),
      // -- 是否根据子组件的大小来收缩 GridView 的尺寸
      shrinkWrap: false,
      // -- 设置网格的内边距
      padding: const EdgeInsets.all(12),
      // -- 设置网格中主轴方向（通常是垂直方向）上的间距
      mainAxisSpacing: 12,
      // -- 设置网格中交叉轴方向（通常是水平方向）上的间距
      crossAxisSpacing: 12,
      // -- 控制子组件的宽高比,置为 1.0 表示子组件的宽高相等；如果设为 2.0，表示宽是高的两倍
      childAspectRatio: 1,
      // -- 是否自动为每个子组件添加 KeepAlive,可以保持滚动出视口的子组件不被销毁，常用于保持其状态
      addAutomaticKeepAlives: false,
      // -- 是否为每个子组件添加重绘边界
      addRepaintBoundaries: true,
      // -- 设置预加载区域的大小,控制预加载的区域距离，通常用于性能优化，提前加载即将滚动到视图中的子组件
      cacheExtent: 100,
      children: List.generate(
        20,
        (index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(
                255,
                random.nextInt(255),
                random.nextInt(255),
                random.nextInt(255),
              ),
            ),
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 动态网格（不固定列数）
class Extent extends StatelessWidget {
  const Extent({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return GridView.extent(
      // -- 每个子组件的最大宽度
      maxCrossAxisExtent: 100.0,
      padding: const EdgeInsets.all(12),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: List.generate(
        20,
        (index) {
          return Container(
            color: Color.fromARGB(
              255,
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DancingScript',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 长列表的处理
class Builder extends StatelessWidget {
  const Builder({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(
              255,
              random.nextInt(255),
              random.nextInt(255),
              random.nextInt(255),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
              ),
            ),
          ),
        );
      },
    );
  }
}

/// 混合列表
class MixedList extends StatelessWidget {
  const MixedList({super.key});

  @override
  Widget build(BuildContext context) {
    var items = List.generate(
      10000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    // return const Basic();
    return const Separated();
    // return const Horizontal();
  }
}

/// 1. 静态列表
class Basic extends StatelessWidget {
  const Basic({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView(
        // -- 为所有列表项设置固定的高度或宽度，这样可以提高渲染性能
        itemExtent: 40,
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('客服'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('卡包'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('收藏'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}

/// 2. 带分隔符的列表
class Separated extends StatefulWidget {
  const Separated({super.key});

  @override
  State<Separated> createState() => _SeparatedState();
}

class _SeparatedState extends State<Separated> {
  final _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (_controller.hasClients && _controller.offset > 0) {
              _controller.animateTo(
                -20,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            }
          },
          child: const Text(
            'ListView',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint(_controller.offset.toString());
          _controller.animateTo(
            _controller.offset + 500,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
        child: const Icon(Icons.arrow_downward),
      ),
      body: ListView.separated(
        // -- 指定列表项的数量(必填)
        itemCount: 80,
        // -- 滚动方向
        scrollDirection: Axis.vertical,
        // -- 反向展示
        reverse: false,
        // -- 控制列表滚动的物理特性
        physics: const BouncingScrollPhysics(),
        // -- 间距
        padding: const EdgeInsets.all(16),
        // -- 预先加载的区域大小（在可见区域外的缓存大小），可以提升滚动时的性能
        cacheExtent: 100,
        // -- 用于控制滚动行为的控制器，可以监听滚动事件或手动控制滚动位置
        controller: _controller,
        // -- 用于构建列表项之间的分隔符(必填)
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: index == 0 ? 4 : 1,
            color: index == 0 ? Colors.redAccent : Colors.black45,
          );
        },
        // -- 用于根据索引构建每个列表项的回调函数(必填)
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "index is ${index + 1}",
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 3. 横向滚动
class Horizontal extends StatelessWidget {
  const Horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('横向滚动'),
      ),
      body: SizedBox(
        height: 110,
        // -- 滚动条
        child: Scrollbar(
          // -- 决定滚动条的“拇指”（滚动条的滑块部分）是否始终可见
          thumbVisibility: true,
          // -- 决定滚动条的“轨道”（滚动条背景部分）是否可见
          trackVisibility: true,
          // -- 滚动条的厚度
          thickness: 2,
          // -- 置滚动条角的圆角半径
          radius: const Radius.circular(4),
          // -- 决定滚动条是否可以通过用户的拖拽操作进行互动
          interactive: true,
          // -- 指定滚动条应该显示在哪一侧
          scrollbarOrientation: ScrollbarOrientation.bottom,
          // -- 列表
          child: ListView(
            // -- 是否使用 Flutter 中的 PrimaryScrollController
            primary: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                margin: const EdgeInsets.only(right: 10),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                margin: const EdgeInsets.only(right: 10),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                margin: const EdgeInsets.only(right: 10),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                margin: const EdgeInsets.only(right: 10),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

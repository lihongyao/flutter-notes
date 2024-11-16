import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _items = List.generate(
    20,
    (index) => ({
      'avatar': 'https://inews.gtimg.com/newsapp_bt/0/12324907168/1000',
      'title': '黑神话·悟空',
      'subTitle': '我若成佛，天下无魔；我若成魔，佛奈我何。',
    }),
  );
  var _isLoading = false;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // -- 监听滚动事件
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.pixels >
            _controller.position.maxScrollExtent - 40 &&
        !_isLoading) {
      _loadMore();
    }
  }

  // -- 模拟加载更多
  Future<void> _loadMore() async {
    setState(() {
      _isLoading = true;
    });

    // 模拟延迟加载
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _items.addAll(
        List.generate(
          10,
          (index) => ({
            'avatar': 'https://inews.gtimg.com/newsapp_bt/0/12324907168/1000',
            'title': '黑神话·悟空',
            'subTitle': '我若成佛，天下无魔；我若成魔，佛奈我何。',
          }),
        ),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉刷新'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          // -- 刷新指示器距离顶部的距离
          displacement: 40,
          // -- 控制可滚动内容顶部的偏移量，如果你想让刷新指示器在用户拖动更长距离后才显示，可以增加这个值
          edgeOffset: 0,
          // -- 设置刷新指示器的前景颜色
          color: Colors.white,
          // -- 设置刷新指示器的背景颜色
          backgroundColor: Colors.black,
          // -- 设置进度指示器的线条宽度
          strokeWidth: 2,
          // -- 触发刷新的模式
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          // -- 写法 1
          // onRefresh: () {
          //   debugPrint('__refresh__');
          //   // -- Future 类似于JS中的Promise，异步操作
          //   return Future.delayed(const Duration(seconds: 1));
          // },
          // -- 写法 2

          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              _items = List.generate(
                5,
                (index) => ({
                  'avatar':
                      'https://inews.gtimg.com/newsapp_bt/0/12324907168/1000',
                  'title': '黑神话·悟空',
                  'subTitle': '我若成佛，天下无魔；我若成魔，佛奈我何。',
                }),
              );
            });
          },
          child: Scrollbar(
            // -- 是否显示滚动条（总是，默认只有在滑动时才显示）
            thumbVisibility: true,
            // -- 控制器，和 ListView 一致
            controller: _controller,
            // -- ListView 滚动时，scroll事件通过冒泡机制传递给Scrollbar
            // -- 这里 NotificationListener 只是为了演示，实际开发中不需要写
            // -- 在onNotification方法中，返回true则不再冒泡，返回false继续冒泡
            child: NotificationListener(
              onNotification: (ScrollEndNotification event) {
                return false;
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                itemCount: _items.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == _items.length) {
                    // const SizedBox.shrink();
                    return _isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '数据加载中...',
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const Text(
                            '没有更多啦～',
                            textAlign: TextAlign.center,
                          );
                  }

                  // 正常显示 item 的内容
                  Map<String, String> data = _items[index];
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.network(data['avatar']!),
                      ),
                    ),
                    title: Text("${data['title']!}.$index"),
                    subtitle: Text(
                      data['subTitle']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

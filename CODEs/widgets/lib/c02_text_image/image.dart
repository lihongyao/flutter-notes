import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // -- 本地图片
            Image.asset(
              'assets/images/robot.png',
              width: 200, // 固定图片宽度为 200
              fit: BoxFit.contain, // 保持比例，自动调整高度
            ),
            const SizedBox(height: 10),

            // -- 网络图片
            Image.network(
              'https://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190515/fade6cdfbc0a40c2a44f115e54e5e12b.jpeg',
            ),
            // -- 背景图片
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://p4.itc.cn/q_70/images01/20220516/659633871c1b433ab7abbfc3735eb270.jpeg',
                  ),
                ),
              ),
            ),
            // -- 圆形头像
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://img0.baidu.com/it/u=4094512489,4273355634&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const ClipOval(
                  child: Image(
                    width: 100,
                    height: 100,
                    image: NetworkImage(
                      'https://img0.baidu.com/it/u=4094512489,4273355634&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                    ),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

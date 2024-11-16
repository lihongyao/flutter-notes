import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String imgUrl =
        'https://img0.baidu.com/it/u=738864153,2089870264&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orange,
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black38,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange,
                  offset: Offset(10, 10),
                  blurRadius: 2,
                ),
              ],
            ),
            child: const Text(
              'China',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

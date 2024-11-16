import 'package:flutter/material.dart';

// -- 布局组件
// import 'package:widgets/c01_layouts/container.dart';
// import 'package:widgets/c01_layouts/row.dart';
// import 'package:widgets/c01_layouts/column.dart';
// import 'package:widgets/c01_layouts/stack.dart';

// import 'package:widgets/c02_text_image/text.dart';
// import 'package:widgets/c02_text_image/image.dart';

// import 'package:widgets/c03_list_and_grid/list_view.dart';
// import 'package:widgets/c03_list_and_grid/pull_refresh.dart';
// import 'package:widgets/c03_list_and_grid/grid_view.dart';
import 'package:widgets/c03_list_and_grid/dismiss.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'widgets',
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_custom_painer_shapes/pages/arc_paint_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            'Shape Painter',
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Arc',
                icon: Icon(Icons.architecture),
              ),
              Tab(
                text: 'Circle',
                icon: Icon(Icons.circle_outlined),
              ),
              Tab(
                text: 'Image',
                icon: Icon(Icons.image),
              ),
              Tab(
                text: 'Line',
                icon: Icon(Icons.stacked_line_chart_sharp),
              ),
              Tab(
                text: 'Rectangle',
                icon: Icon(Icons.crop_square_sharp),
              ),
              Tab(
                text: 'Rounded Rectangle',
                icon: Icon(Icons.crop_square_rounded),
              ),
              Tab(
                  text: 'Triangle',
                  icon: Icon(
                    Icons.arrow_drop_up_sharp,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

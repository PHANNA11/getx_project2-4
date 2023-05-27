import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_2_4/view/page2.dart';

import '../controller/counter_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
        init: controller,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.to(() => Page2());
                    },
                    child: const Text(
                      'Next page',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${controller.number.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: 'xcvbnm',
                  onPressed: () {
                    controller.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'vbnm,.',
                  onPressed: () {
                    controller.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          );
        });
  }
}

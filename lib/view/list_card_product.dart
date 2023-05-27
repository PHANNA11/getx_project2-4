import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';

class ListCardProduct extends StatelessWidget {
  ListCardProduct({Key? key}) : super(key: key);
  ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: GetBuilder<ProductController>(builder: (contexts) {
        return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var pro = controller.products[index];
              return Card(
                child: ListTile(
                  title: Text(pro.name),
                  subtitle: Text(pro.price.toString()),
                ),
              );
            });
      }),
    );
  }
}

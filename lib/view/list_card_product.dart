import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_2_4/view/update.dart';

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
                elevation: 0,
                child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            controller.deleteProduct(pro.code);
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 237, 69, 3),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Remove',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            Get.to(() => UpdateProduct(
                                  pro: pro,
                                ));
                          },
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(pro.name),
                      subtitle: Text(pro.price.toString()),
                    )),
              );
            });
      }),
    );
  }
}

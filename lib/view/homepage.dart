import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:getx_2_4/model/product_model.dart';
import 'package:getx_2_4/view/list_card_product.dart';
import '../controller/counter_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductController controller = Get.put(ProductController());
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: controller,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ListCardProduct());
                    },
                    child: badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -12),
                      showBadge: controller.products.isEmpty ? false : true,
                      ignorePointer: false,
                      onTap: null,
                      badgeContent: Text(controller.products.length.toString()),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.circle,
                        badgeColor: Colors.red,
                        padding: const EdgeInsets.all(5),
                        borderRadius: BorderRadius.circular(4),
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            body: Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter mame'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: qtyController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter Qty'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Enter Price'),
                  ),
                )
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CupertinoButton(
                      color: Colors.red,
                      child: const Text('clear'),
                      onPressed: () {
                        clearText();
                      }),
                  CupertinoButton(
                      color: Colors.blue,
                      child: const Text('save'),
                      onPressed: () async {
                        controller.addProduct(
                          ProductModel(
                            code: DateTime.now().microsecondsSinceEpoch,
                            name: nameController.text,
                            qty: int.parse(qtyController.text),
                            price: double.parse(priceController.text),
                          ),
                        );
                        clearText();
                      })
                ],
              ),
            ),
          );
        });
  }

  void clearText() {
    nameController.text = '';
    qtyController.text = '';
    priceController.text = '';
  }
}

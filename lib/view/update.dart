import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';
import '../model/product_model.dart';
import 'list_card_product.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({Key? key, required this.pro}) : super(key: key);
  ProductModel pro;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  ProductController controller = Get.put(ProductController());

  TextEditingController nameController = TextEditingController();

  TextEditingController qtyController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearText();
    setState(() {
      nameController.text = widget.pro.name;
      qtyController.text = widget.pro.qty.toString();
      priceController.text = widget.pro.price.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: controller,
        builder: (contexts) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit'),
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
                        await controller.updateProduct(
                          ProductModel(
                            code: widget.pro.code,
                            name: nameController.text,
                            qty: int.parse(qtyController.text),
                            price: double.parse(priceController.text),
                          ),
                        );
                        Get.back();
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

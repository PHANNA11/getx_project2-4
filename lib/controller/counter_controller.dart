import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_2_4/model/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  void addProduct(ProductModel pro) async {
    products.add(pro);
    update();
  }

  void deleteProduct(int code) async {
    int index = products.indexWhere((element) => element.code == code);
    products.removeAt(index);
    update();
  }

  updateProduct(ProductModel pro) async {
    int index = products.indexWhere((element) => element.code == pro.code);
    products[index] = pro;
    update();
  }
}

import 'package:get/get.dart';
import 'package:getx_project/models/Product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: "Test item1",
          productImage: 'db',
          productDescription: 'sakjfdsfkjdsfkdsf',
          price: 339.99),
      Product(
          id: 1,
          productName: "Test item2",
          productImage: 'db',
          productDescription: 'sakjfdsfkjdsfkdsf',
          price: 500),
      Product(
          id: 1,
          productName: "Test item2",
          productImage: 'db',
          productDescription: 'sakjfdsfkjdsfkdsf',
          price: 300.99),
      Product(
          id: 1,
          productName: "Test item4",
          productImage: 'db',
          productDescription: 'sakjfdsfkjdsfkdsf',
          price: 200),
    ];

    products.value = productResult;
  }
}

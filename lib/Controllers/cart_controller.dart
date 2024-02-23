import 'package:get/get.dart';
import 'package:getx_project/models/Product.dart';

class CartController extends GetxController {
  var cartItems = RxList<Product>().obs;
  int get count => cartItems.value.length;
  
  double get totalPrice =>
      cartItems.value.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    cartItems.value.add(product);
  }

  void removeFromCart(int id) {
    cartItems.value.removeWhere((item) => item.id == id);
  }
}

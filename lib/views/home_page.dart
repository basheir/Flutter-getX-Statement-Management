import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Controllers/cart_controller.dart';
import 'package:getx_project/Controllers/shopping_controller.dart';

class HomePage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                      Text(
                                          '\$${controller.products[index].price}',
                                          style: TextStyle(fontSize: 24)),
                                    ],
                                  )
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white),
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                // color: Colors.blue,
                                // textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total amount \$ ${controller.totalPrice}",
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.amber,
        label: GetX<CartController>(builder: (controller) {
          return Text('${controller.count}');
        }),
      ),
    );
  }
}

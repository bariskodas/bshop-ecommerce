import 'package:bariskodas_testc/riverpod/riverpods.dart';
import 'package:bariskodas_testc/ui_components/large_button.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'widgets/cart_product_widget.dart';
import 'widgets/order_completed_widget.dart';
import 'widgets/total_price_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double _height = MediaQuery.of(context).size.height;
    var watch = ref.watch(cartRiverpod);
    List products = watch.readProductList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My cart"),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(cartRiverpod).deleteAllProducts();
              })
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: _height * 0.66,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Padding(
                padding: Constants.hPadding24,
                child: products.isEmpty
                    ? const Center(child: Text("You didn't add products yet."))
                    : Column(
                        children: List.generate(
                            products.length,
                            (index) => CartProductWidget(
                              colorName: products[index]["colorName"],
                                imageURL: products[index]["image"],
                                title: products[index]["title"],
                                price: products[index]["price"].toString(),
                                count: products[index]["count"].toString(),
                                increment: () => watch.incrementProductCount(
                                    products[index]["id"]),
                                decrement: () => watch.decrementProductCount(
                                    id: products[index]["id"]),
                                dismissed: products[index]["id"],
                                dismissibleKey:
                                    ValueKey("pr${products[index]["id"]}"))),
                      ),
              ),
            ),
          ),
          //* price
          Padding(
            padding: Constants.hPadding16,
            child: const TotalPriceWidget(),
          )
        ],
      ),
      floatingActionButton: LargeButton(
          text: "Buy now",
          onPressed: () async {
            ref.read(cartRiverpod).deleteAllProducts();
            showModalBottomSheet(
                context: context,
                builder: (context) => const OrderCompletedWidget());
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

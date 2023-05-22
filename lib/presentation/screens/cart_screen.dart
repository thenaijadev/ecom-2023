import 'package:ecommerce_application/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_application/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_application/constants/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is Cartloading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (state is CartLoaded) {
            return Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: state.getCart
                        .productQuantity(state.getCart.shopItems)
                        .keys
                        .length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        addItem: () {
                          cartBloc.add(CartProductAdded(
                              product: state.getCart
                                  .productQuantity(state.cart.shopItems)
                                  .keys
                                  .elementAt(index)));
                        },
                        removeItem: () {
                          cartBloc.add(CartProductRemoved(
                              product: state.getCart
                                  .productQuantity(state.cart.shopItems)
                                  .keys
                                  .elementAt(index)));
                        },
                        product: state.getCart
                            .productQuantity(state.cart.shopItems)
                            .keys
                            .elementAt(index),
                        quantity: state.getCart
                            .productQuantity(state.cart.shopItems)
                            .values
                            .elementAt(index),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Total: \$${state.getCart.totalAmount}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: kaccentGold,
                    minWidth: 350,
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right_outlined,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text("Something went wrong!!");
          }
        },
      ),
    );
  }
}

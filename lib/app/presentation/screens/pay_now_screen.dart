import 'package:ecommerce_application/app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_application/app/data/models/card_model.dart';
import 'package:ecommerce_application/app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayNowScreen extends StatefulWidget {
  const PayNowScreen({super.key, required this.card});
  final CardModel card;
  @override
  State<PayNowScreen> createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: state.getCart
                        .productQuantity(state.cart.shopItems)
                        .length,
                    itemBuilder: ((context, index) {
                      return Product(
                          product: state.getCart
                              .productQuantity(state.cart.shopItems)
                              .keys
                              .elementAt(index),
                          quantity: state.getCart
                              .productQuantity(state.cart.shopItems)
                              .values
                              .elementAt(index));
                    }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Total: \$${state.getCart.totalAmount}",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    minWidth: 350,
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pay",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text("No item in cart");
          }
        },
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key, required this.product, required this.quantity});

  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(61, 184, 184, 184),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(product.image!),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 25),
                    child: Text(
                      product.title!,
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          " $quantity",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 10),
                    child: Text(
                      '\$${(product.price * quantity).round()}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

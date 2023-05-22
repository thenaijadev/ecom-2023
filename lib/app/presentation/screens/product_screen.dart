import 'package:ecommerce_application/app/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_application/constants/constants.dart';
import 'package:ecommerce_application/app/data/models/product_model.dart';
import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  late CartBloc cartBloc;
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  double amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        key: key,
        appBar: appBar(context, key, ""),
        body: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.product.image!,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      child: Text(
                        widget.product.title!,
                        style: const TextStyle(
                            fontSize: 18,
                            color: ktextGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20),
                      child: Text(
                        "\$${widget.product.price! * amount}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text(
                        "Description:",
                        style: TextStyle(
                            fontSize: 15,
                            color: ktextGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 20),
                          child: Text(
                            widget.product.description!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: ktextGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: MaterialButton(
                          onPressed: () {
                            cartBloc
                                .add(CartProductAdded(product: widget.product));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: kaccentGold,
                          minWidth: 350,
                          height: 60,
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

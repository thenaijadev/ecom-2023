import 'package:ecommerce_application/app/bloc/cart/cart_bloc.dart';

import 'package:ecommerce_application/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBar(context, key, title) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        key.currentState!.openDrawer();
      },
      child: Image.asset(
        "assets/images/menu_icon.png",
        height: 40,
      ),
    ),
    title: Text(title),
    centerTitle: true,
    actions: [
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pushNamed("/cart");
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                return CircleAvatar(
                  backgroundColor: kaccentGold,
                  radius: 8,
                  child: Text(
                    state.getCart.shopItems.length.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                );
              } else {
                return const Text("");
              }
            },
          )
        ],
      ),
      const SizedBox(
        width: 5,
      )
    ],
    backgroundColor: Colors.white,
  );
}

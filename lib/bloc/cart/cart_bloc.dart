import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/data/models/cart_data.dart';
import 'package:ecommerce_application/data/models/product_model.dart';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(Cartloading()) {
    // ignore: void_checks
    on<CartEvent>((
      event,
      emit,
    ) async {
      if (event is CartStarted) {
        emit(_mapCartStartedToState());
      } else if (event is CartProductAdded) {
        emit(_mapCartProductAddedToState(event, state));
      } else if (event is CartProductRemoved) {
        emit(_mapCartProductRemovedToState(event, state));
      }
    });
  }

  CartState _mapCartStartedToState() {
    return const CartLoaded(cart: CartData(shopItems: [], totalAmount: 0));
  }

  CartState _mapCartProductAddedToState(
      CartProductAdded event, CartState state) {
    if (state is CartLoaded) {
      if (state.cart == null) {
        return CartError();
      }

      List<ProductModel> shopItems = List.from(state.cart.shopItems)
        ..add(event.product!);

      double totalAmount = 0;
      for (final product in shopItems) {
        totalAmount = product.price! + totalAmount;
      }

      return CartLoaded(
        cart: CartData(
            shopItems: shopItems, totalAmount: totalAmount.round().toInt()),
      );
    } else {
      return CartError();
    }
  }

  CartState _mapCartProductRemovedToState(
      CartProductRemoved event, CartState state) {
    // if (state is CartLoaded) {
    //   var shopItems = state.cart.shopItems;

    //   return CartLoaded(
    //     cart: CartData(
    //         shopItems: List.from(shopItems)..remove(event.product),
    //         totalAmount: state.cart.totalAmount),
    //   );
    // } else {
    //   return CartError();
    // }
    if (state is CartLoaded) {
      if (state.cart == null) {
        return CartError();
      }

      List<ProductModel> shopItems = List.from(state.cart.shopItems)
        ..remove(event.product);

      double totalAmount = 0;
      for (final product in shopItems) {
        totalAmount = (-product.price! + totalAmount);
      }

      return CartLoaded(
        cart: CartData(
            shopItems: shopItems, totalAmount: -totalAmount.round().toInt()),
      );
    } else {
      return CartError();
    }
  }
}

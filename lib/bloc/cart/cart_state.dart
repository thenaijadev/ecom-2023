// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class Cartloading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final CartData cart;
  const CartLoaded({required this.cart});
  @override
  List<Object?> get props => [cart];
  CartData get getCart => cart;
}

class CartError extends CartState {
  @override
  List<Object?> get props => [];
}

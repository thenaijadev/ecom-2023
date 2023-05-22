part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllProducts extends ProductsEvent {
  @override
  List<Object> get props => [];
}

class GetAllProductCategories extends ProductsEvent {}

class GetProductsByCategory extends ProductsEvent {
  GetProductsByCategory({required this.category});
  final String category;
}

part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsNotLoaded extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> _models;
  ProductsLoaded(this._models);
  List<ProductModel> get getallProducts => _models;
  @override
  List<Object> get props => [_models];
}

class ProductsCategoriesLoaded extends ProductsState {
  final List<dynamic> _categories;
  ProductsCategoriesLoaded(this._categories);
  List<dynamic> get getCategoriesProjects => _categories;
  @override
  List<Object> get props => [_categories];
}

class ProductsByCategoryLoaded extends ProductsState {
  final List<ProductModel> _models;
  ProductsByCategoryLoaded(this._models);
  List<ProductModel> get getProductsByCategory => _models;
  @override
  List<Object> get props => [_models];
}

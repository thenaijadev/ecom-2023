import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/app/data/models/product_model.dart';
import 'package:ecommerce_application/app/data/providers/category_provider.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce_application/app/data/repos/product_repository.dart';

part 'product_events.dart';
part 'product_states.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoading()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetAllProducts) {
        try {
          List<ProductModel> models = await ProductRepository.getProducts();
          emit(ProductsLoaded(models));
        } catch (e) {
          emit(ProductsNotLoaded());
        }
      } else if (event is GetAllProductCategories) {
        List<dynamic> categories = await CategoriesProvider.getAllCategories();
        emit(ProductsCategoriesLoaded(categories));
      } else if (event is GetProductsByCategory) {
        String route = event.category;
        List<dynamic> categories =
            await ProductRepository.getProductsByCategory(route);
        emit(ProductsCategoriesLoaded(categories));
      }
    });
  }
}

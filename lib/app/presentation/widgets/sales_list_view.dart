import 'package:ecommerce_application/app/bloc/products_bloc/products_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_application/constants/constants.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  late ProductsBloc productsList;
  @override
  void initState() {
    super.initState();
    productsList = BlocProvider.of<ProductsBloc>(context);
    productsList.add(GetAllProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const ProductCard(
                  name: "",
                  title: "",
                  image: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          );
        } else if (state is ProductsLoaded) {
          return SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: state.getallProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed("/product",
                        arguments: state.getallProducts[index]);
                  },
                  child: ProductCard(
                    image: Container(
                      height: 200,
                      width: 200,
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
                            state.getallProducts[index].image!,
                          ),
                        ),
                      ),
                    ),
                    name: state.getallProducts[index].title!,
                    title: "\$${state.getallProducts[index].price}",
                  ),
                );
              },
            ),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.title,
  });
  final Widget image;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            image,
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                name,
                style: const TextStyle(
                    color: ktextGrey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

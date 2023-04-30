import 'package:flutter/material.dart';
import "./product_card.dart";

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            width: 10,
          ),
          ProductCard(),
          SizedBox(
            width: 5,
          ),
          ProductCard(),
          SizedBox(
            width: 5,
          ),
          ProductCard(),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

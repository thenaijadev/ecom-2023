import 'package:ecommerce_application/constants/constants.dart';

import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        bottom: TabBar(
            controller: _controller,
            indicatorColor: kaccentGold,
            indicatorWeight: 4,
            tabs: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Men",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Text("Women",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              Text(
                "Kids",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )
            ]),
      ),
      body: TabBarView(controller: _controller, children: [
        CategoryCardList(
          categoryList: [
            CategoryItemCard(
              onPressed: () {},
              title: "New",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Clothes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Shoes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Accessories",
              image: "assets/images/Image.png",
            ),
          ],
        ),
        CategoryCardList(
          categoryList: [
            CategoryItemCard(
              onPressed: () {},
              title: "New",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Clothes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Shoes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Accessories",
              image: "assets/images/Image.png",
            ),
          ],
        ),
        CategoryCardList(
          categoryList: [
            CategoryItemCard(
              onPressed: () {},
              title: "New",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Clothes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Shoes",
              image: "assets/images/Image.png",
            ),
            CategoryItemCard(
              onPressed: () {},
              title: "Accessories",
              image: "assets/images/Image.png",
            ),
          ],
        )
      ]),
    );
  }
}

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({super.key, required this.categoryList});
  final List<Widget> categoryList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: categoryList,
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onPressed});
  final String title;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              opacity: 0.65,
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ),
    );
  }
}

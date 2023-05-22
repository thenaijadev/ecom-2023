import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
import 'package:ecommerce_application/app/presentation/widgets/sales_list_view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application/app/presentation/widgets/fade_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late num value = 0;
  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          value = controller.value * 10;
          value = value.ceil();
        });
      });
    controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
          child: Scaffold(
        key: key,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
        appBar: appBar(context, key, ""),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: AnimatedCrossFade(
                firstChild: FadeCard(
                  title: "Mens accesories",
                  image: "assets/images/product.jpg",
                  onPressed: () {},
                ),
                secondChild: FadeCard(
                  image: "assets/images/product.jpg",
                  title: "Women's accesories ",
                  onPressed: () {},
                ),
                duration: const Duration(seconds: 1),
                crossFadeState: value == 5 ||
                        value == 4 ||
                        value == 3 ||
                        value == 2 ||
                        value == 1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
            const CategorieList(
              title: "Trending",
            ),
            const CategorieList(title: "For Men"),
            const CategorieList(
              title: "For Women",
            ),
          ]),
        ),
      )),
    );
  }
}

class CategorieList extends StatefulWidget {
  const CategorieList({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CategorieList> createState() => _CategorieListState();
}

class _CategorieListState extends State<CategorieList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 20),
          child: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const CategoryListView(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController controller_1;
  late AnimationController controller_2;

  late Animation<double> animation_1;
  late Animation<double> animation_2;
  @override
  void initState() {
    super.initState();
    controller_1 =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    controller_2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation_1 = Tween<double>(begin: 0, end: 10).animate(controller_1)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    animation_2 = Tween<double>(begin: 300, end: 440).animate(controller_2)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller_1.forward();
    controller_2.forward();
  }

  @override
  void dispose() {
    controller_1.dispose();
    controller_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/Image.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: animation_1.value, sigmaY: animation_1.value),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: animation_2.value,
                ),
                const Text(
                  " Thebie's signature.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "With long experience in the fashon industry, we sell only the best products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 215, 215, 215),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 198, 171, 89),
                    minWidth: 350,
                    height: 60,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class FadeCard extends StatelessWidget {
  const FadeCard(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.image});
  final String? title;
  final void Function()? onPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 219, 219, 221),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: ktextGrey,
              blurRadius: 3.0,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 5, 5, 5),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: onPressed!,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: kaccentGold,
                  minWidth: 50,
                  child: const Text(
                    "Explore",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      image!,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

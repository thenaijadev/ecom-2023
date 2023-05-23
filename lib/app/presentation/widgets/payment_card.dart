import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 121, 121, 121),
                offset: Offset.zero,
                blurRadius: 3,
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color.fromARGB(99, 0, 0, 0),
                Color.fromARGB(127, 0, 0, 0),
                Color.fromARGB(255, 0, 0, 0),
                Colors.black,
                Colors.black,
              ],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30, bottom: 30),
              child: Image.asset("assets/images/chip.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "**** **** **** 2938",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Card Holder Name",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        "Okwor Chukwuemeka N",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        "Expiry Date",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        "05/23",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset("assets/images/mastercard.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

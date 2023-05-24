import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.holderName,
    required this.onTap,
    required this.expiryDate,
    required this.cardNumber,
  });

  final String holderName;
  final void Function() onTap;
  final String expiryDate;
  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "**** **** **** ${cardNumber.substring(cardNumber.length - 4, cardNumber.length)}",
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Card Holder Name",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          holderName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Expiry Date",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Text(
                          "${expiryDate.substring(0, 2)} / ${expiryDate.substring(3, expiryDate.length)}",
                          style: const TextStyle(
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
      ),
    );
  }
}

import 'package:ecommerce_application/app/presentation/widgets/payment_method_card.dart';
import 'package:ecommerce_application/router/routes.dart';
import 'package:flutter/material.dart';

class BottomPaymentMethodSheet extends StatelessWidget {
  const BottomPaymentMethodSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Payment Methods",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentMethod(
              title: "Card",
              onTap: () {
                Navigator.pushNamed(context, Routes.paymentScreen);
              },
            ),
            PaymentMethod(
              title: "Cash",
              onTap: () {},
            ),
            PaymentMethod(
              title: "Credit",
              onTap: () {},
            ),
            PaymentMethod(
              title: "Transfer",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

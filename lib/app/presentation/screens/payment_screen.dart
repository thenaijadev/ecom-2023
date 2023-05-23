import 'package:ecommerce_application/app/presentation/widgets/add_card_form.dart';
import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
import 'package:ecommerce_application/app/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentChoiceScreen extends StatefulWidget {
  const PaymentChoiceScreen({super.key});

  @override
  State<PaymentChoiceScreen> createState() => _PaymentChoiceScreenState();
}

class _PaymentChoiceScreenState extends State<PaymentChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context, key, "Payment"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (index) {
                return const AddCardForm();
              });
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: const [
          PaymentCard(),
        ],
      ),
    );
  }
}

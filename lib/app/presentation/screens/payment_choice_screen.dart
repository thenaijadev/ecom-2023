import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
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
      appBar: appBar(context, key, "Payment"),
    );
  }
}

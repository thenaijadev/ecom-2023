import 'package:ecommerce_application/app/bloc/payment_card_bloc/payment_cards_bloc.dart';
import 'package:ecommerce_application/app/presentation/widgets/add_card_form.dart';
import 'package:ecommerce_application/app/presentation/widgets/app_bar.dart';
import 'package:ecommerce_application/app/presentation/widgets/payment_card.dart';
import 'package:ecommerce_application/router/routes.dart';
import 'package:ecommerce_application/utilities/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: appBar(context, key, "Choose card to pay"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (index) {
                return const AddCardForm();
              });
        },
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<PaymentCardsBloc, PaymentCardsState>(
        builder: (context, state) {
          if (state is PaymentCardsInitial) {
            return const Center(
              child: Text("Add a card to proceed with payment."),
            );
          } else if (state is AddedPaymentCardState) {
            logger.e(state.cardList.length);
            return ListView.builder(
              itemCount: state.cardList.length,
              itemBuilder: (context, index) {
                return PaymentCard(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.payNowScreen,
                        arguments: state.getCards[index]);
                  },
                  holderName: state.getCards[index].holderName,
                  expiryDate: state.getCards[index].expiryDate,
                  cardNumber: state.getCards[index].cardNumber,
                );
              },
            );
          } else {
            return const Center(
              child: Text("Cannot get cards."),
            );
          }
        },
      ),
    );
  }
}

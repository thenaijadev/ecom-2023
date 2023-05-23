import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/app/data/models/card_model.dart';
import 'package:equatable/equatable.dart';

part 'payment_cards_event.dart';
part 'payment_cards_state.dart';

class PaymentCardsBloc extends Bloc<PaymentCardsEvent, PaymentCardsState> {
  PaymentCardsBloc() : super(PaymentCardsInitial()) {
    on<PaymentCardsEvent>((event, emit) {
      if (event is AddPaymentCard) {
        List<Card> cards = [];
        final String cardHolder = event.card.holderName;
        final String expiryDate = event.card.expiryDate;
        final String cvv = event.card.cvv;
        final int cardNumber = event.card.cardNumber;
        cards.add(Card(
            cardNumber: cardNumber,
            holderName: cardHolder,
            expiryDate: expiryDate,
            cvv: cvv));
        emit(AddedPaymentCardState(cardList: cards));
      }
    });
  }
}

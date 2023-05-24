import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/app/data/models/card_model.dart';
import 'package:equatable/equatable.dart';

part 'payment_cards_event.dart';
part 'payment_cards_state.dart';

class PaymentCardsBloc extends Bloc<PaymentCardsEvent, PaymentCardsState> {
  PaymentCardsBloc() : super(const AddedPaymentCardState(cardList: [])) {
    on<PaymentCardsEvent>((event, emit) {
      if (event is AddPaymentCard) {
        emit(_addCard(event, state));
      }
    });
  }
}

PaymentCardsState _addCard(AddPaymentCard event, PaymentCardsState state) {
  if (state is AddedPaymentCardState) {
    List<CardModel> cards = List.from(state.cardList)..add(event.card);

    return AddedPaymentCardState(cardList: cards);
  } else {
    return PaymentCardsErrorState();
  }
}

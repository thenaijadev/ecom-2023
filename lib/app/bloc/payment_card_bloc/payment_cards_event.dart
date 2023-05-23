part of 'payment_cards_bloc.dart';

abstract class PaymentCardsEvent extends Equatable {
  const PaymentCardsEvent();

  @override
  List<Object> get props => [];
}

class AddPaymentCard extends PaymentCardsEvent {
  const AddPaymentCard({required this.card});
  final Card card;
  @override
  List<Object> get props => [card];
}

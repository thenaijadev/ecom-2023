part of 'payment_cards_bloc.dart';

abstract class PaymentCardsState extends Equatable {
  const PaymentCardsState();

  @override
  List<Object> get props => [];
}

class PaymentCardsInitial extends PaymentCardsState {}

class AddedPaymentCardState extends PaymentCardsState {
  const AddedPaymentCardState({required this.cardList});
  final List<Card> cardList;
  List<Card> get getCards => cardList;
  @override
  List<Object> get props => [cardList];
}

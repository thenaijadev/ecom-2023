part of 'payment_cards_bloc.dart';

abstract class PaymentCardsState extends Equatable {
  const PaymentCardsState();

  @override
  List<Object> get props => [];
}

class PaymentCardsInitial extends PaymentCardsState {
  const PaymentCardsInitial({required this.cardList});
  final List<CardModel> cardList;
  @override
  List<Object> get props => [cardList];
}

class AddedPaymentCardState extends PaymentCardsState {
  const AddedPaymentCardState({required this.cardList});
  final List<CardModel> cardList;
  List<CardModel> get getCards => cardList;
  @override
  List<Object> get props => [cardList];
}

class PaymentCardsErrorState extends PaymentCardsState {}

class Card {
  Card(
      {required this.cardNumber,
      required this.holderName,
      required this.expiryDate,
      required this.cvv});
  final int cardNumber;
  final String holderName;
  final String expiryDate;
  final String cvv;
}

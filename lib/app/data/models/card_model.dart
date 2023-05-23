class Card {
  Card(
      {required this.cartNumber,
      required this.holderName,
      required this.expiryDate,
      required this.cvv});
  final int cartNumber;
  final String holderName;
  final DateTime expiryDate;
  final String cvv;
}

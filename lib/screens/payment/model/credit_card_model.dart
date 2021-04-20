class CreditCard{
  String cardHolder;
  String cardNumber;
  String expirationDate;

  CreditCard(this.cardHolder, this.cardNumber, this.expirationDate);

  @override
  String toString() {
    return 'CreditCardModel{cardHolder: $cardHolder, cardNumber: $cardNumber, expirationDate: $expirationDate}';
  }
}
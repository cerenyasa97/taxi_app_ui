class CreditCard{
  String cardHolder;
  String cardNumber;
  String expirationDate;
  String cvc;

  CreditCard(this.cardHolder, this.cardNumber, this.expirationDate, this.cvc);

  @override
  String toString() {
    return 'CreditCardModel{cardHolder: $cardHolder, cardNumber: $cardNumber, expirationDate: $expirationDate, cvc: $cvc}';
  }
}
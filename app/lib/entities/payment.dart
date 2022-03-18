class Payment {
  final double amountPaid;
  final int paidAt;

  const Payment({required this.amountPaid, required this.paidAt});
}

class PaymentBalance {
  final double amountPaid;
  final int beersDrunk;
  final double balance;
  final int beersLeft;

  const PaymentBalance({required this.amountPaid, required this.beersDrunk, required this.balance, required this.beersLeft});
}
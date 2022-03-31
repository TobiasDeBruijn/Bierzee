import 'package:bierzee/entities/user.dart';

class PaymentEntity {
  final double amountPaid;
  final int paidAt;
  final bool denied;
  final NamedUserEntity paidBy;
  final NamedUserEntity? deniedBy;
  final String paymentId;

  const PaymentEntity({required this.amountPaid, required this.paidAt, required this.denied, required this.paidBy, required this.paymentId, this.deniedBy});
}

class PaymentBalance {
  final double amountPaid;
  final int beersDrunk;
  final double balance;
  final int beersLeft;

  const PaymentBalance({required this.amountPaid, required this.beersDrunk, required this.balance, required this.beersLeft});
}
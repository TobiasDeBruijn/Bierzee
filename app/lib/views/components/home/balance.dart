import 'package:bierzee/entities/payment.dart';
import 'package:bierzee/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceComponent extends StatefulWidget {
  const BalanceComponent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  BalanceComponentState createState() => BalanceComponentState();
}

class BalanceComponentState extends State<BalanceComponent> {

  double balance = 0;
  int beersLeft = 0;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {
    PaymentBalance? balance = await widget.user.getPaymentBalance();
    if(balance == null) {
      Future<Null>.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text('Er is iets verkeerd gegaan. Probeer het later opnieuw')));
      });
      return;
    }

    setState(() {
      this.balance = balance.balance;
      this.beersLeft = balance.beersLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balans:',
                    style: GoogleFonts.oxygen(fontSize: 25),
                  ),
                  Text(
                    '€' + balance.toStringAsFixed(2),
                    style: GoogleFonts.oxygen(fontSize: 25),
                  )
                ],
              ),
              Text(
                'Dat zijn $beersLeft biertjes',
                style: GoogleFonts.oxygen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
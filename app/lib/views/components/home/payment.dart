import 'dart:async';

import 'package:bierzee/entities/payment.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/util/http.dart';
import 'package:bierzee/views/components/home/balance.dart';
import 'package:bierzee/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart';

class PaymentComponent extends StatefulWidget {
  const PaymentComponent({Key? key, required this.user, required this.balanceComponentKey}) : super(key: key);

  final User user;
  final GlobalKey<BalanceComponentState> balanceComponentKey;

  @override
  _PaymentComponentState createState() => _PaymentComponentState();
}

class _PaymentComponentState extends State<PaymentComponent> {

  double totalPaid = 0;
  double paidToday = 0;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {
    Response<List<PaymentEntity>> payments = await widget.user.getPayments();
    if(!payments.handleNotOk(context)) {
      return;
    }

    DateTime dateTime = DateTime.now();
    int startOfTodayEpoch = (DateTime.utc(dateTime.year, dateTime.month, dateTime.day).millisecondsSinceEpoch / 1000.0).floor();

    setState(() {
      totalPaid = payments.value!.map((e) => e.amountPaid).sum;
      paidToday = payments.value!
          .where((element) => element.paidAt > startOfTodayEpoch)
          .map((e) => e.amountPaid)
          .sum;

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading ? _getIsLoading() : _getIsLoaded()
      ),
    );
  }

  Widget _getIsLoading() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _getIsLoaded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Totaal betaald:',
                style: GoogleFonts.oxygen(fontSize: 20)
            ),
            Text(
              '€' + totalPaid.toStringAsFixed(2),
              style: GoogleFonts.oxygen(fontSize: 20),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vandaag betaald:',
              style: GoogleFonts.oxygen(fontSize: 20),
            ),
            Text(
                '€' + paidToday.toStringAsFixed(2),
                style: GoogleFonts.oxygen(fontSize: 20)
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text('Betalen'),
                onPressed: () => showPaymentDialog(),
              )
            ],
          ),
        ),
      ],
    );
  }

  void showPaymentDialog() {
    showDialog(
      context: context,
      builder: (builder) => _PaymentDialog(user: widget.user, balanceComponentKey: widget.balanceComponentKey, getValuesFunction: getValues)
    );
  }
}

class _PaymentDialog extends StatefulWidget {
  const _PaymentDialog({Key? key, required this.user, required this.balanceComponentKey, required this.getValuesFunction}) : super(key: key);

  final Function() getValuesFunction;
  final GlobalKey<BalanceComponentState> balanceComponentKey;
  final User user;

  @override
  State<_PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<_PaymentDialog> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _inputController = TextEditingController();

  bool isPaymentLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Betalen',
                  style: GoogleFonts.oxygen(fontSize: 25)
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        controller: _inputController,
                        decoration: const InputDecoration(
                          labelText: 'Bedrag',
                          prefixText: '€',
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) => requireAllValid(value, [validateRequired, (string) { return RegExp(REGEXP_DECIMAL).hasMatch(string!) ? null : 'Invalid'; }]),
                      ),
                      ElevatedButton(
                        child: isPaymentLoading ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Betalen'),
                        onPressed: () {
                          if(!_formKey.currentState!.validate()) {
                            return;
                          }

                          processPayment();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  void processPayment() async {
    setState(() {
      isPaymentLoading = true;
    });

    double value = double.parse(_inputController.text
        .replaceAll('€', "")
        .replaceAll(',', '.'));
    Response<void> success = await widget.user.makePayment(value);

    setState(() {
      isPaymentLoading = false;
    });

    if (!success.handleNotOk(context)) {
      return;
    }

    widget.balanceComponentKey.currentState!.getValues();
    widget.getValuesFunction();
    Navigator.pop(context);

    showDialog(context: context, builder: (builder) => _PaymentSuccessDialog());
  }
}

class _PaymentSuccessDialog extends StatefulWidget {
  const _PaymentSuccessDialog({Key? key}) : super(key: key);

  @override
  State<_PaymentSuccessDialog> createState() => _PaymentSuccessDialogState();
}

class _PaymentSuccessDialogState extends State<_PaymentSuccessDialog> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Je hebt betaald!',
                        style: GoogleFonts.oxygen(fontSize: 30),
                      ),
                    ),
                    Image.asset(
                    "assets/bas.gif",
                    )
                  ]
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
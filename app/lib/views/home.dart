import 'dart:math';

import 'package:bierzee/entities/user.dart';
import 'package:bierzee/views/components/home/balance.dart';
import 'package:bierzee/views/components/home/beer.dart';
import 'package:bierzee/views/components/home/payment.dart';
import 'package:bierzee/views/components/home/user.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  GlobalKey<BalanceComponentState> balanceComponentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            UserComponent(user: widget.user),
            BalanceComponent(key: balanceComponentKey, user: widget.user),
            PaymentComponent(user: widget.user, balanceComponentKey: balanceComponentKey),
            BeerComponent(user: widget.user, balanceComponentKey: balanceComponentKey),
          ],
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text('Bierzee'),
    );
  }
}
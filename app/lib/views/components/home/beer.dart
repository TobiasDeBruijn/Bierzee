import 'package:bierzee/entities/beer.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/util/http.dart';
import 'package:bierzee/views/components/home/balance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerComponent extends StatefulWidget {
  const BeerComponent({Key? key, required this.user, required this.balanceComponentKey}) : super(key: key);

  final GlobalKey<BalanceComponentState> balanceComponentKey;
  final User user;

  @override
  _BeerComponentState createState() => _BeerComponentState();

}

class _BeerComponentState extends State<BeerComponent> {

  int beersConsumedTotal = 0;
  int beersConsumedToday = 0;

  bool isLoading = true;
  bool consumeBeerLoading = false;

  int lastConsumedBeerAt = 0;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {
    Response<List<Beer>> beers = await widget.user.getBeers();

    if(!beers.handleNotOk(context)) {
      return;
    }

    beersConsumedTotal = beers.value!.length;

    DateTime dateTime = DateTime.now();
    int startOfTodayEpoch = (DateTime.utc(dateTime.year, dateTime.month, dateTime.day).millisecondsSinceEpoch / 1000.0).floor();

    beersConsumedToday = beers.value!
        .where((element) => element.consumedAt > startOfTodayEpoch)
        .length;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: isLoading ? getContentLoading() : getContentLoaded(),
        ),
      ),
    );
  }

  Widget getContentLoaded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Totaal gedronken:',
              style: GoogleFonts.oxygen(fontSize: 20),
            ),
            Text(
              beersConsumedTotal.toString(),
              style: GoogleFonts.oxygen(fontSize: 20),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vandaag gedronken:',
              style: GoogleFonts.oxygen(fontSize: 20),
            ),
            Text(
              beersConsumedToday.toString(),
              style: GoogleFonts.oxygen(fontSize: 20),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: consumeBeerLoading ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Text('Nog één'),
                onPressed: () => consumeBeer(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget getContentLoading() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  void consumeBeer() async {
    if(DateTime.now().millisecondsSinceEpoch - lastConsumedBeerAt < 2000) {
      Future<Null>.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text("Rustig aan.")));
      });
      return;
    }

    setState(() {
      lastConsumedBeerAt = DateTime.now().millisecondsSinceEpoch;
      consumeBeerLoading = true;
    });

    Response<void> success = await widget.user.consumeBeers(1);
    if(!success.handleNotOk(context)) {
      return;
    }

    setState(() {
      consumeBeerLoading = false;
    });

    getValues();
    widget.balanceComponentKey.currentState!.getValues();
  }
}
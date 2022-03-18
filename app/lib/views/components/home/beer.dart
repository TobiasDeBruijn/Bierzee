import 'package:bierzee/entities/user.dart';
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

  @override
  void initState() {
    super.initState();

    widget.user.getBeers().then((beers) {
      debugPrint('Beers fetched');
      if(beers == null) {
        Future<Null>.delayed(Duration.zero, () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text('Er is iets verkeerd gegaan. Probeer het later opnieuw')));
        });

        return;
      }

      beersConsumedTotal = beers.length;

      DateTime dateTime = DateTime.now();
      int startOfTodayEpoch = (DateTime.utc(dateTime.year, dateTime.month, dateTime.day).millisecondsSinceEpoch / 1000.0).floor();

      beersConsumedToday = beers
          .where((element) => element.consumedAt > startOfTodayEpoch)
          .length;

      setState(() {
        isLoading = false;
      });
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
        Row(
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
    setState(() {
      consumeBeerLoading = true;
    });

    bool success = await widget.user.consumeBeers(1);
    if(!success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: const Text('Er is iets verkeerd gegaan. Probeer het later opnieuw')));
      setState(() {
        consumeBeerLoading = false;
      });
      return;
    }

    setState(() {
      beersConsumedTotal += 1;
      beersConsumedToday += 1;
      consumeBeerLoading = false;
    });

    widget.balanceComponentKey.currentState!.getValues();
  }
}
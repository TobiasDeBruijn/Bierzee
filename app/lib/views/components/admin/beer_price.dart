import 'package:bierzee/api/beer/price.dart';
import 'package:bierzee/api/common.dart';
import 'package:bierzee/api/organization/beer/price.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/proto/payloads/beer.pb.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:bierzee/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BeerPriceComponent extends StatefulWidget {

  const BeerPriceComponent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _BeerPriceState createState() => _BeerPriceState();
}

const double FONT_SIZE = 18.0;

class _BeerPriceState extends State<BeerPriceComponent> {

  double currentBeerPrice = 0;
  int lastChangedAt = 0;
  String lastChangedBy = '';

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {
    Response<GetBeerPriceResponse> beerPrice = await BeerPrice.price(widget.user.sessionId);
    if(!beerPrice.handleNotOk(context)) {
      return;
    }

    setState(() {
      currentBeerPrice = beerPrice.value!.price;
      lastChangedAt = beerPrice.value!.lastUpdated.toInt();
      lastChangedBy = beerPrice.value!.lastChangedBy.name;
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
          child: isLoading ? _getIsLoading() : _getIsLoaded(),
        ),
      ),
    );  }

  Widget _getIsLoaded() {
    final DateTime dtLastChangedAt = DateTime.fromMillisecondsSinceEpoch(lastChangedAt * 1000, isUtc: true).toLocal();
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Huidige prijs:',
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE)
            ),
            Text(
              '€' + currentBeerPrice.toStringAsFixed(2),
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE)
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Laatst gewijzigd: ',
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE)
            ),
            Text(
              dateFormat.format(dtLastChangedAt),
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Laats gewijzigd door:',
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE),
            ),
            Text(
              lastChangedBy,
              style: GoogleFonts.oxygen(fontSize: FONT_SIZE),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text('Wijzigen'),
                onPressed: () => openChangePriceDialog(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _getIsLoading() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  void openChangePriceDialog() {
    showDialog(
      context: context,
      builder: (builder) => _ChangeBeerPriceDialog(getValuesFunction: getValues, user: widget.user)
    );
  }
}

class _ChangeBeerPriceDialog extends StatefulWidget {

  const _ChangeBeerPriceDialog({Key? key, required this.getValuesFunction, required this.user}) : super(key: key);

  final Function() getValuesFunction;
  final User user;

  @override
  _ChangeBeerPriceDialogState createState() => _ChangeBeerPriceDialogState();
}

class _ChangeBeerPriceDialogState extends State<_ChangeBeerPriceDialog> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _inputController = TextEditingController();

  bool isUpdating = false;

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
                  'Prijs aanpassen',
                  style: GoogleFonts.oxygen(fontSize: FONT_SIZE),
                ),
                Text(
                  'Let op: dit werkt met terugwerkende kracht',
                  style: GoogleFonts.oxygen(),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFormField(
                        controller: _inputController,
                        decoration: const InputDecoration(
                          labelText: 'Prijs',
                          prefixText: '€'
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) => requireAllValid(value, [validateRequired, (string) { return RegExp(REGEXP_DECIMAL).hasMatch(string!) ? null : 'Invalid'; }]),
                      ),
                      ElevatedButton(
                        child: isUpdating ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2))
                          : const Text('Wijzigen'),
                        onPressed: () {
                          if(!_formKey.currentState!.validate()) {
                            return;
                          }

                          updatePrice();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void updatePrice() async {
    setState(() {
      isUpdating = true;
    });

    double value = double.parse(_inputController.text
        .replaceAll('€', '')
        .replaceAll(',', '.'));
    Response<void> success = await OrgBeerPrice.price(PostSetBeerPriceRequest(newPrice: value), widget.user.sessionId);

    setState(() {
      isUpdating = false;
    });

    if(!success.handleNotOk(context)) {
      return;
    }

    widget.getValuesFunction();
    Navigator.pop(context);
  }
}
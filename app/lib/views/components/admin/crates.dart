
import 'package:bierzee/api/common.dart';
import 'package:bierzee/api/organization/beer/purchase.dart';
import 'package:bierzee/api/organization/beer/stock.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/main.dart';
import 'package:bierzee/proto/entities/beer.pb.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:bierzee/util/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AdminCrateComponent extends StatefulWidget {

  final User user;

  const AdminCrateComponent({Key? key, required this.user}) : super(key: key);

  @override
  State<AdminCrateComponent> createState() => _AdminCrateComponentState();
}

class _AdminCrateComponentState extends State<AdminCrateComponent> {

  List<DataRow> _crates = [];
  int _bottlesLeft = 0;
  double _paymentBalance = 0;
  
  bool _isLoadingStock = true;

  @override
  void initState() {
    super.initState();
    _loadStock();
  }

  void _loadStock() async {
    setState(() {
      _isLoadingStock = true;
    });

    Response<GetBeerStockResponse> response = await OrgBeerStock.stock(widget.user.sessionId);

    if(!mounted) {
      return;
    }

    setState(() {
      _isLoadingStock = false;
    });

    if(!response.handleNotOk(context)) {
      return;
    }

    setState(() {
      _crates = response.value!.beerStockEntries.map((e) => _buildStockRow(e)).toList();
      _bottlesLeft = response.value!.bottlesLeft.toInt();
      _paymentBalance = -1.0; // TODO fetch this from somewhere
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _isLoadingStock ? _getIsLoading() : _getIsLoaded()
        ),
      )
    );
  }

  Widget _getIsLoading () {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _getIsLoaded() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Voorraad',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Voorraad:',
              style: GoogleFonts.oxygen(fontWeight: FontWeight.bold)
            ),
            Text(
              _bottlesLeft.toString() + ' flesjes',
              style: GoogleFonts.oxygen(color: _bottlesLeft < 0 ? Colors.red : Colors.black)
            ),
          ],
        ),
        /* TODO: We need to get this info first
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Balans:',
              style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
            ),
            Text(
              '€' + _paymentBalance.toStringAsFixed(2),
              style: GoogleFonts.oxygen(color: _paymentBalance < 0 ? Colors.red : Colors.black),
            )
          ],
        ),
         */
        Divider(),
        Text(
          'Gehaalde voorraad',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
        _crates.isNotEmpty ? DataTable(
          columns: _getHeaders(),
          rows: _crates,
        ) : Text('Er zijn geen kratten gehaald', style: GoogleFonts.oxygen()),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text('Toevoegen'),
              onPressed: () {
                showDialog(context: context, builder: (builder) => _RegisterCratesPurchasedDialog(user: widget.user, getCratesFunction: _loadStock));
              },
            )
          ],
        )
      ],
    );
  }

  List<DataColumn> _getHeaders() {
    return [
      DataColumn(
        label: Text(
          'Gebruiker',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        )
      ),
      DataColumn(
        label: Text(
          'Kratten',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        )
      ),
      DataColumn(
        label: Text(
          'Datum',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        )
      )
    ];
  }

  DataRow _buildStockRow(BeerStockEntry stockEntry) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return DataRow(
      cells: [
        DataCell(
          Text(
            stockEntry.purchasedBy.name,
            style: GoogleFonts.oxygen(),
          )
        ),
        DataCell(
          Text(
            stockEntry.cratesAquired.toString(),
            style: GoogleFonts.oxygen(),
          )
        ),
        DataCell(
          Text(
            dateFormat.format(DateTime.fromMillisecondsSinceEpoch(stockEntry.purchasedAt.toInt() * 1000, isUtc: true).toLocal()),
            style: GoogleFonts.oxygen(),
          )
        )
      ]
    );
  }
}

class _RegisterCratesPurchasedDialog extends StatefulWidget {
  final User user;
  final Function() getCratesFunction;

  const _RegisterCratesPurchasedDialog({Key? key, required this.user, required this.getCratesFunction}) : super(key: key);

  @override
  State<_RegisterCratesPurchasedDialog> createState() => _RegisterCratesPurchasedDialogState();
}

class _RegisterCratesPurchasedDialogState extends State<_RegisterCratesPurchasedDialog> {

  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _amountPaidInput = TextEditingController();
  final TextEditingController _cratesInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: _getDialogContent(),
          )
        ],
      ),
    );
  }

  Widget _getDialogContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Aankoop registreren',
            style: GoogleFonts.oxygen(fontWeight: FontWeight.bold)
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _cratesInput,
                decoration: const InputDecoration(
                  labelText: 'Aantal kratten',
                ),
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) => requireAllValid(value, [validateRequired, (string) { return RegExp("^\\d+\$").hasMatch(string!) ? null : 'Invalid'; }]),
              ),
              TextFormField(
                controller: _amountPaidInput,
                decoration: const InputDecoration(
                    labelText: 'Prijs',
                    prefixText: '€'
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) => requireAllValid(value, [validateRequired, (string) { return RegExp(REGEXP_DECIMAL).hasMatch(string!) ? null : 'Invalid'; }]),
              ),
              ElevatedButton(
                child: _isLoading ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                ) : const Text('Opslaan'),
                onPressed: () {
                  if(!_formKey.currentState!.validate()) {
                    return;
                  }

                  _registerCratePurchase();
                },
              )
            ],
          ),
        )
      ],
    );
  }

  void _registerCratePurchase() async {
    setState(() {
      _isLoading = true;
    });

    int cratesPurchased = int.parse(_cratesInput.text);
    double amountPaid = double.parse(_amountPaidInput.text
        .replaceAll('€', '')
        .replaceAll(',', '.'));

    Response<void> response = await OrgBeerPurchase.purchase(PostPurchaseBeerStockRequest(cratesPurchased: cratesPurchased, amountPaid: amountPaid), widget.user.sessionId);
    setState(() {
      _isLoading = false;
    });

    if(!response.handleNotOk(context)) {
      return;
    }

    widget.getCratesFunction();
    Navigator.pop(context);
  }
}
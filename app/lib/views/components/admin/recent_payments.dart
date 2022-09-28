import 'package:bierzee/api/common.dart';
import 'package:bierzee/api/organization/payment/deny.dart';
import 'package:bierzee/api/organization/payment/list.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/proto/entities/payment.pb.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:bierzee/proto/payloads/payment.pb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecentPaymentsComponent extends StatefulWidget {
  final User user;

  const RecentPaymentsComponent({Key? key, required this.user}) : super(key: key);

  @override
  State<RecentPaymentsComponent> createState() => _RecentPaymentsComponentState();
}

class _RecentPaymentsComponentState extends State<RecentPaymentsComponent> {
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  List<DataRow> _recentPayments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getRecentPayments();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _isLoading ? _getIsLoading() : _getIsLoaded(),
        ),
      ),
    );
  }

  /// The widget to be displayed while loading
  Widget _getIsLoading() {
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
          'Recente betalingen',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
        _recentPayments.isNotEmpty ? DataTable(
          columns: _getHeaderColumns(),
          rows: _recentPayments,
        ) : Text(
          'Er zijn geen recente betalingen',
          style: GoogleFonts.oxygen(),
        )
      ],
    );
  }

  List<DataColumn> _getHeaderColumns() {
    return [
      DataColumn(
        label: Text(
          'Gebruiker',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Bedrag',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Datum',
          style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }
  
  DataRow _buildRow(Payment paymentEntity) {
    return DataRow(
      onLongPress: () => _openPaymentEntityDialog(paymentEntity),
      color: MaterialStateProperty.all(paymentEntity.denied ? Colors.red[200] : Colors.white),
      cells: [
        DataCell(
          Text(
              paymentEntity.user.name,
              style: GoogleFonts.oxygen()
          ),
        ),
        DataCell(
          Text(
            paymentEntity.amount.toStringAsFixed(2),
            style: GoogleFonts.oxygen(),
          ),
        ),
        DataCell(
          Text(
            _dateFormat.format(DateTime.fromMillisecondsSinceEpoch(paymentEntity.paidAt.toInt() * 1000, isUtc: true).toLocal()),
            style: GoogleFonts.oxygen()
          ),
        ),
      ]
    );
  }
  
  void _openPaymentEntityDialog(Payment paymentEntity) {
    debugPrint('Opening dialog');

    showDialog(
      context: context,
      builder: (builder) => _RecentPaymentDialog(user: widget.user, paymentEntity: paymentEntity, getPaymentsFunction: _getRecentPayments)
    );
  }

  void _getRecentPayments() async {
    setState(() {
      _isLoading = true;
    });

    Response<GetListPaymentsResponse> paymentEntities = await OrgPaymentList.list(widget.user.sessionId);

    if(!mounted) {
      return;
    }

    if(!paymentEntities.handleNotOk(context)) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    List<DataRow> allPayments = paymentEntities.value!.payments.map((e) => _buildRow(e)).toList().reversed.toList();
    int endIdx = allPayments.length > 10 ? 10 : allPayments.length;
    List<DataRow> recentPayments = allPayments.getRange(0, endIdx).toList();

    setState(() {
      _recentPayments = recentPayments;
      _isLoading = false;
    });
  }
}

class _RecentPaymentDialog extends StatefulWidget {
  final User user;
  final Payment paymentEntity;
  final Function() getPaymentsFunction;

  const _RecentPaymentDialog({Key? key, required this.user, required this.paymentEntity, required this.getPaymentsFunction}) : super(key: key);

  @override
  State<_RecentPaymentDialog> createState() => _RecentPaymentDialogState();
}

class _RecentPaymentDialogState extends State<_RecentPaymentDialog> {
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  bool _isDenyingLoading = false;
  bool _isAllowingLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topCenter,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: _getDialogContents(),
          )
        ],
      ),
    );
  }

  Widget _getDialogContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Betaling',
                style: GoogleFonts.oxygen(fontWeight: FontWeight.bold)
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Naam:",
              style: GoogleFonts.oxygen(),
            ),
            Text(
              widget.paymentEntity.user.name,
              style: GoogleFonts.oxygen(),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bedrag:',
              style: GoogleFonts.oxygen(),
            ),
            Text(
              "€" + widget.paymentEntity.amount.toStringAsFixed(2),
              style: GoogleFonts.oxygen(),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Betaald op",
              style: GoogleFonts.oxygen()
            ),
            Text(
              _dateFormat.format(DateTime.fromMillisecondsSinceEpoch(widget.paymentEntity.paidAt.toInt() * 1000, isUtc: true).toLocal()),
              style: GoogleFonts.oxygen()
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Geweigerd:',
              style: GoogleFonts.oxygen(),
            ),
            Text(
              (widget.paymentEntity.denied ? 'Ja' : 'Nee'),
              style: GoogleFonts.oxygen()
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Geweigerd door:',
              style: GoogleFonts.oxygen(),
            ),
            Text(
              (widget.paymentEntity.denied ? widget.paymentEntity.deniedBy.name : 'n.v.t.'),
              style: GoogleFonts.oxygen()
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              widget.paymentEntity.denied ? _getAllowButton() : _getDenyButton(),
            ],
          ),
        )
      ],
    );
  }

  Widget _getAllowButton() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green[400])),
      child: _isAllowingLoading ? _getButtonLoading() : Text('Accepteren'),
      onPressed: () => _markAllowed(),
    );
  }

  Widget _getDenyButton() {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red[300])),
      child: _isDenyingLoading ? _getButtonLoading() : Text('Weigeren'),
      onPressed: () => _markDenied(),
    );
  }

  Widget _getButtonLoading() {
    return CircularProgressIndicator(color: Colors.white,strokeWidth: 2);
  }

  void _markDenied() async {
    setState(() {
      _isDenyingLoading = true;
    });
    Response<void> success = await OrgPaymentDeny.deny(PostDenyPaymentRequest(paymentId: widget.paymentEntity.id, denied: true), widget.user.sessionId);
    setState(() {
      _isDenyingLoading = false;
    });
    if(!success.handleNotOk(context)) {
      return;
    }

    widget.getPaymentsFunction();
    Navigator.pop(context);
  }

  void _markAllowed() async {
    setState(() {
      _isAllowingLoading = true;
    });
    Response<void> success = await OrgPaymentDeny.deny(PostDenyPaymentRequest(paymentId: widget.paymentEntity.id, denied: false), widget.user.sessionId);
    setState(() {
      _isAllowingLoading = false;
    });
    if(!success.handleNotOk(context)) {
      return;
    }

    widget.getPaymentsFunction();
    Navigator.pop(context);
  }
}

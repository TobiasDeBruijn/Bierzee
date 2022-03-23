import 'package:bierzee/entities/system.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/util/http.dart';
import 'package:bierzee/util/validation.dart';
import 'package:bierzee/views/components/admin/beer_price.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminUserComponent extends StatefulWidget {
  final User user;

  const AdminUserComponent({Key? key, required this.user}) : super(key: key);

  @override
  _UserComponentState createState() => _UserComponentState();
}

class _UserComponentState extends State<AdminUserComponent> {

  /// A list of users
  /// The first Row is the table header
  List<TableRow> users = [
    TableRow(children: [
      Text(
        'Naam',
        style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
      ),
      Text(
        'Balans',
        style: GoogleFonts.oxygen(fontWeight: FontWeight.bold),
      )
    ])
  ];

  /// Whether the users are still being loaded in
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: isLoading ? _getIsLoading() : _getIsLoaded(),
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

  /// The widget to be displayed when loaded
  Widget _getIsLoaded() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Table(
          children: users,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Text('Gebruiker aanmaken'),
                onPressed: () => _openCreateUserDialog(),
              )
            ],
          ),
        )
      ],
    );
  }

  /// Get, and set, the values from the server
  void getValues() async {
    Response<List<OwningUser>> response =
        await OwningUser.getUsers(widget.user);
    if (!response.handleNotOk(context)) {
      return;
    }

    response.value!.sort((a, b) => a.name.compareTo(b.name));

    setState(() {
      isLoading = false;

      if(users.length > 1) {
        users.removeRange(1, users.length - 1);
      }

      users.addAll(response.value!.map((e) => _buildTableRow(e)));
    });
  }

  TableRow _buildTableRow(OwningUser user) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            user.name,
            style: GoogleFonts.oxygen(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '€' + user.balance.toStringAsFixed(2),
            style: GoogleFonts.oxygen(),
          ),
        )
      ]
    );
  }

  void _openCreateUserDialog() => showDialog(
      context: context,
      builder: (builder) =>
          _CreateUserDialog(user: widget.user, getValuesFunction: getValues));
}

class _CreateUserDialog extends StatefulWidget {
  final User user;
  final Function() getValuesFunction;

  const _CreateUserDialog(
      {Key? key, required this.user, required this.getValuesFunction})
      : super(key: key);

  @override
  _CreateUserDialogState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends State<_CreateUserDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();

  bool isSaving = false;

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
                Text('Gebruiker toevoegen',
                    style: GoogleFonts.oxygen(fontSize: FONT_SIZE)),
                _getForm()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: _employeeIdController,
            decoration: const InputDecoration(
              labelText: 'Personeelsnummer',
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: (value) =>
                requireAllValid(value, [validateRequired, validateLength]),
          ),
          TextFormField(
            controller: _employeeNameController,
            decoration: const InputDecoration(
              labelText: 'Naam',
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: (value) =>
                requireAllValid(value, [validateRequired, validateLength]),
          ),
          ElevatedButton(
            child: isSaving ? _getIsSaving() : const Text('Aanmaken'),
            onPressed: () => _createUser(),
          )
        ],
      ),
    );
  }

  Widget _getIsSaving() {
    return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2));
  }

  void _createUser() async {
    setState(() {
      isSaving = true;
    });

    Response<void> response = await System(user: widget.user).addUser(
        employeeId: _employeeIdController.text,
        name: _employeeNameController.text,
        isAdmin: false);
    setState(() {
      isSaving = false;
    });

    if (!response.handleNotOk(context)) {
      return;
    }

    widget.getValuesFunction();
    Navigator.pop(context);
  }
}

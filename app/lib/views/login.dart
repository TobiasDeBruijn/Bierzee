import 'package:bierzee/entities/user.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/util/validation.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bierzee Login')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formState = GlobalKey();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formState,
      child: Column(
        children: [
          TextFormField(
            controller: widget._employeeIdController,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              labelText: 'Personeelsnummer'
            ),
          ),
          TextFormField(
            controller: widget._userNameController,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              labelText: 'Naam'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              child: const Text('Continue'),
              onPressed: () async {
                if(!widget._formState.currentState!.validate()) {
                  return;
                }

                User? user = await User.doLogin(widget._employeeIdController.text, widget._userNameController.text);
                if(user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Er is iets verkeerd gegaan. Probeer het later opnieuw'),
                  ));
                  return;
                }

                navigateToHome(user);
              },
            )
          )
        ],
      ),
    );
  }

  void navigateToHome(User user) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeView(user: user)));
  }
}
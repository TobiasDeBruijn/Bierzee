import 'package:bierzee/entities/user.dart';
import 'package:bierzee/util/http.dart';
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
  final TextEditingController _passwordController = TextEditingController();

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
            controller: widget._passwordController,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              labelText: 'Wachtwoord'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                if(!widget._formState.currentState!.validate()) {
                  return;
                }

                Response<User?> user = await User.doLogin(widget._employeeIdController.text, widget._passwordController.text);
                if(!user.handleNotOk(context)) {
                  return;
                }

                if(user.value == null) {
                  Future<Null>.delayed(Duration.zero, () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verkeerd wachtwoord')));
                  });

                  return;
                }

                navigateToHome(user.value!);
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
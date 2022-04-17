import 'package:bierzee/api/auth/login.dart';
import 'package:bierzee/api/common.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/proto/payloads/auth.pb.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/util/validation.dart';
import 'package:bierzee/views/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
  final TextEditingController _loginId = TextEditingController();
  final TextEditingController _organizationId = TextEditingController();
  final TextEditingController _organizationPassword = TextEditingController();

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
            controller: widget._loginId,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              labelText: 'Login ID'
            ),
          ),
          TextFormField(
            controller: widget._organizationId,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              labelText: 'Organisatie ID'
            ),
          ),
          TextFormField(
            controller: widget._organizationPassword,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            obscureText: true,
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                labelText: 'Wachtwoord'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.oxygen(color: Colors.black),
                    children: [
                      TextSpan(text: 'Nog geen account? '),
                      TextSpan(
                        text: 'Registreer hier',
                        style: GoogleFonts.oxygen(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => RegisterView()));
                          }
                      )
                    ]
                  )
                ),
                ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    if(!widget._formState.currentState!.validate()) {
                      return;
                    }

                    Response<PostLoginResponse> response = await AuthLogin.login(PostLoginRequest(
                      userLoginId: widget._loginId.text,
                      organizationCode: widget._organizationId.text,
                      organizationPassword: widget._organizationPassword.text,
                    ));

                    if(!response.handleNotOk(context)) {
                      return;
                    }

                    if(response.value == null) {
                      Future<Null>.delayed(Duration.zero, () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Onbekende login')));
                      });

                      return;
                    }


                    navigateToHome(User(
                      name: response.value!.user.name,
                      isAdmin: response.value!.isAdmin,
                      id: response.value!.user.id,
                      sessionId: response.value!.session.id,
                      organizationId: response.value!.organization.id,
                      organizationCode: response.value!.organization.code,
                    ));
                  },
                ),
              ],
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
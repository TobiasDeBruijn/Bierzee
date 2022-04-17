import 'package:bierzee/api/common.dart';
import 'package:bierzee/api/organization/create.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/proto/payloads/organization.pb.dart';
import 'package:bierzee/util/validation.dart';
import 'package:bierzee/views/home.dart';
import 'package:bierzee/views/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text('Bierzee Registreren')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final GlobalKey<FormState> _formState = GlobalKey();
  final TextEditingController _orgName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userLoginId = TextEditingController();
  final TextEditingController _orgPassword = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        children: [
          TextFormField(
            controller: _orgName,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                labelText: 'Organisatie Naam'
            ),
          ),
          TextFormField(
            controller: _orgPassword,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            obscureText: true,
            decoration: const InputDecoration(
                labelText: 'Wachtwoord'
            ),
          ),
          TextFormField(
            controller: _userName,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                labelText: 'Gebruikersnaam'
            ),
          ),
          TextFormField(
            controller: _userLoginId,
            validator: (value) => requireAllValid(value, [validateLength, validateRequired]),
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
                labelText: 'Login ID'
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
                      TextSpan(text: 'Heeft u al een account? '),
                      TextSpan(
                        text: 'Naar login',
                        style: GoogleFonts.oxygen(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginView()));
                          }
                      )
                    ]
                  )
                ),
                ElevatedButton(
                  child: _isLoading ? _getButtonChildLoading() : _getButtonChildLoaded(),
                  onPressed: () async {
                    if(!_formState.currentState!.validate()) {
                      return;
                    }

                    setState(() {
                      _isLoading = true;
                    });

                    Response<PostCreateOrganizationResponse> response = await OrgCreate.create(PostCreateOrganizationRequest(
                      organizationPassword: _orgPassword.text,
                      userLoginId: _userLoginId.text,
                      userName: _userName.text,
                      organizationName: _orgName.text
                    ));

                    setState(() {
                      _isLoading = false;
                    });

                    if(!response.handleNotOk(context)) {
                      return;
                    }

                    navigateToHome(User(
                      name: response.value!.user.name,
                      id: response.value!.user.id,
                      organizationId: response.value!.organization.id,
                      sessionId: response.value!.session.id,
                      isAdmin: true,
                      organizationCode: response.value!.organization.code,
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getButtonChildLoading() {
    return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
    );
  }

  Widget _getButtonChildLoaded() {
    return const Text('Registreren');
  }

  void navigateToHome(User user) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => HomeView(user: user)));
  }
}
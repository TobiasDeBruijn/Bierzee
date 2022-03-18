import 'package:bierzee/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hallo, ' + user.name,
              style: GoogleFonts.oxygen(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          )
      ),
    );
  }
}
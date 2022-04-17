import 'package:bierzee/api/about.dart';
import 'package:bierzee/api/common.dart';
import 'package:bierzee/proto/payloads/about.pb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServerInfoComponent extends StatefulWidget {
  const ServerInfoComponent({Key? key}) : super(key: key);

  @override
  _ServerInfoState createState() => _ServerInfoState();
}

class _ServerInfoState extends State<ServerInfoComponent> {

  String _version = "";
  String _repository = "";

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    setState(() {
      _isLoading = true;
    });

    Response<GetAboutResponse> response = await About.about();

    setState(() {
      _isLoading = false;
    });

    if(!response.handleNotOk(context)) {
      return;
    }

    setState(() {
      _version = response.value!.version;
      _repository = response.value!.repository;
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
          child: _isLoading ? getContentLoading() : getContentLoaded(),
        ),
      ),
    );
  }


  Widget getContentLoaded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Server Information',
          style: GoogleFonts.oxygen(fontSize: 20)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Server version',
              style: GoogleFonts.oxygen()
            ),
            Text(
              _version,
              style: GoogleFonts.oxygen()
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Repository',
              style: GoogleFonts.oxygen()
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.only(top: 4, right: 8, bottom: 4, left: 8),
                child: Text(
                  'Open',
                  style: GoogleFonts.oxygen(color: Colors.white)
                ),
              ),
              onTap: () => launch(_repository),
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
}
import 'package:shared_preferences/shared_preferences.dart';

class User {

  final String id;
  final String name;
  final String sessionId;
  final String organizationId;
  final String organizationCode;

  final bool isAdmin;

  const User({required this.id, required this.name, required this.sessionId, required this.isAdmin, required this.organizationId, required this.organizationCode});

  void setPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("sessionId", sessionId);
  }

  void clearPreferences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("sessionId");
  }
}
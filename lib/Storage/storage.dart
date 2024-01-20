import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  Storage._();

  static final Storage instance = Storage._();
  late SharedPreferences sharedPreferences;

  Future<void> initializeStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(String token) async {
    // debugPrint('set token $token');
    await sharedPreferences.setString("token", token);
    await sharedPreferences.setBool("isLoggedIn", true);
  }

  Future<void> setToken(String token) async {
    await sharedPreferences.setString("token", token);
  }

  Future<void> logout() async {
    await sharedPreferences.clear();
  }

  get token => sharedPreferences.getString("token") ?? "";

  get isLoggedIn => sharedPreferences.getBool("isLoggedIn") ?? false;


}
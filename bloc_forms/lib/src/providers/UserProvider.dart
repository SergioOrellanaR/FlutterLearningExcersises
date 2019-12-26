import 'dart:convert';

import 'package:bloc_forms/src/userPreferences/userPreferences.dart';
import 'package:http/http.dart' as http;


class UserProvider {

  String _apiKey = "AIzaSyB7D56-OeMIXZRBdD1YaXXwcsOKvcw83Go";
  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> createUser(String email, String password) async 
  {

    String registerUrlApi = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=";

    return userRequest(email, password, registerUrlApi);

  }

  Future<Map<String, dynamic>> login(String email, String password) async
  {
    String loginUrlApi = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=";

    return userRequest(email, password, loginUrlApi);
  }

  Future<Map<String, dynamic>> userRequest(String email, String password, String url) async
  {
    final authData = {
      "email" : email,
      "password": password,
      "returnSecureToken" : true
    };

    String route = url+_apiKey;

    final response = await http.post(
      route,
      body: json.encode(authData)
    );

    Map<String, dynamic> decodedResponse = json.decode(response.body);

    if(decodedResponse.containsKey('idToken'))
    {
      _prefs.token = decodedResponse["idToken"];
      return {"ok" : true, "token" : decodedResponse["idToken"]};
    }
    else
    {
      return {"ok" : false, "message" : decodedResponse["error"]["message"]};
    }

  }
}
import 'dart:convert';

import 'package:first_app/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String email = '';
  String password = '';
  bool performingLogin = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 15.0),
              
              TextButton(onPressed: () {
                _doLogin();
              }, child: const Text('Entrar'))
            ]
          ),
        ),
      )
    );
  }

  _doLogin() async {

    if(performingLogin) return false;

    performingLogin = true;

    var response = await http.post(
      Uri.parse('http://192.168.1.2:8000/api/login'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    
    performingLogin = false;

    if(response.statusCode == 200) {
      SharedPreferences.getInstance().then((prefs) {
        
        var user = jsonDecode(response.body);
        prefs.setInt('id', user['id']);
        prefs.setString('name', user['name']);
        prefs.setString('email', user['email']);
        prefs.setString('token', user['token']);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (builder) => const HomePage())
        );
      });

      return;
    }

    return Fluttertoast.showToast(
        msg: "Email e/ou senha incorretos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
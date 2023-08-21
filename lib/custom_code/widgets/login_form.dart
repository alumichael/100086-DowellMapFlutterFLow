// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    this.width,
    this.location,
    this.os,
    this.height,
    this.createAJsonVariableInAppStateNamedResponse =
        "this will have response from login",
    required this.navigateTo,
    required this.signUp,
  }) : super(key: key);
  final String? createAJsonVariableInAppStateNamedResponse;
  final double? width;
  final double? height;
  final String? location;
  final String? os;
  final Future<dynamic> Function() signUp;
  final Future<dynamic> Function() navigateTo;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  String _username = '';
  String _password = '';
  bool _passwordVisible = false;
  bool _isError = false;
  bool isIncorrectUserPass = false;
  bool isLoading = false;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  Future<void> _login() async {
    final urlSessionId =
        Uri.parse('https://100014.pythonanywhere.com/api/mobilelogin/');
    var urlIP = Uri.parse('https://api.ipify.org?format=json');
    var urlUserInfo =
        Uri.parse('https://100014.pythonanywhere.com/api/userinfo/');
    var responseIP = await http.get(urlIP);

    var data = jsonDecode(responseIP.body);
    var ip = data['ip'];
    var location = widget.location.toString();
    var os = widget.os.toString();
    final body = json.encode({
      'username': "$_username",
      'password': "$_password",
      'time': DateTime.now().toString(),
      'ip': '$ip',
      'os': '$os',
      'device': 'Phone',
      'location': '$location',
      'timezone': 'null',
      'language': 'null',
      'browser': 'null',
    });
    final response = await http.post(urlSessionId,
        body: body, headers: {'Content-Type': 'application/json'});
    var jsonResponse = jsonDecode(response.body);
    late final userInfo;
    String? sessionId = jsonResponse["session_id"];
    print(sessionId);
    if (jsonResponse['session_id'] != null) {
      final body2 = json.encode({'session_id': "$sessionId"});
      final getUserInfo = await http.post(urlUserInfo,
          body: body2, headers: {'Content-Type': 'application/json'});

      userInfo = jsonDecode(getUserInfo.body);
    }

    if (jsonResponse['session_id'] != null) {
      var response = jsonResponse['session_id'];
      FFAppState().response = userInfo;
      FFAppState().sessionId = sessionId.toString();
      setState(() => isLoading = false);

      setState(() => _isError = false);
      widget.navigateTo();
    } else {
      setState(() => _isError = true);
      setState(() => isLoading = false);
      setState(() => isIncorrectUserPass = true);
      print('Login failed');
    }
  }

  _submitForm() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      await _login();
    } else {
      setState(() {
        isIncorrectUserPass = false;
        _isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    width: 240,
                    image: NetworkImage(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/9DnD1apucfOsyx3FSevb/assets/upl3jp1kh7ms/Logo_500*500.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 400,
                  width: 380,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() => _username = val);
                          },
                          controller: user,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: _isError == true
                                  ? Colors.red
                                  : Colors.green[900],
                              size: 24,
                            ),
                            filled: false,
                            fillColor: Colors.transparent,
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: _isError == true
                                  ? Colors.red
                                  : Color(0xFF187B2B),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 3,
                                  color: _isError == true
                                      ? Colors.red
                                      : Colors.white),
                            ),
                            border: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: _isError == true
                                    ? Colors.red
                                    : Color(0xFF187B2B),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 3,
                                color: _isError == true
                                    ? Colors.red
                                    : Color(0xFF187B2B),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (val) => setState(() => _password = val),
                          controller: pass,
                          obscureText: !_passwordVisible,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                            prefixIcon: Icon(
                              Icons.key,
                              color: _isError == true
                                  ? Colors.red
                                  : Colors.green[900],
                              size: 24,
                            ),
                            filled: false,
                            fillColor: Colors.transparent,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: _isError == true
                                  ? Colors.red
                                  : Color(0xFF187B2B),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: _isError == true
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: _isError == true
                                    ? Colors.red
                                    : Color(0xFF187B2B),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: _isError == true
                                    ? Colors.red
                                    : Color(0xFF187B2B),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: _isError == true
                                    ? Colors.red
                                    : Color(0xFF187B2B),
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = '$value',
                        ),
                      ),
                      SizedBox(height: 18),
                      if (isIncorrectUserPass == true)
                        Text('inCorrect user and password, try again',
                            style: TextStyle(
                                color: isIncorrectUserPass == true
                                    ? Colors.red
                                    : Colors.white)),
                      SizedBox(height: 10),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 50.0,
                        width: 200,
                        margin: EdgeInsets.only(
                            top: isIncorrectUserPass == true ? 25.0 : 0.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() => isLoading = true);
                            await _submitForm();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF187B2B),
                          ),
                          child: isLoading == true
                              ? SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                      color: Colors.white))
                              : Text('Login'),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            widget.signUp();
                          },
                          child: Text("Signup",
                              style: TextStyle(
                                color: Color(0xFF187B2B),
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

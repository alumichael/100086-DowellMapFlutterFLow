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
  //adding all global scoped variables
  final _formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String _username = '';
  String _password = '';
  bool _passwordVisible = false;
  bool _isError = false;
  bool isIncorrectUserPass = false;
  bool isLoading = false;
  bool isLoggedIn = false;
  List<String> workspaces = ['null'];
  late List<String> portfolios;
  String? selectedWorkspace = null;
  String? selectedPortfolio = null;
  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  late final userInfo;
  late final Map<String, dynamic> JsonUserInfo;
  List<Map<String, dynamic>> filteredOrgs = [];

//this function stores workspaces and its ids, and portfolios
  getWorkspaces() async {
    // calling api to get workspaces name "other_orgs"
    final getWorkspaces = await http.post(
        Uri.parse("https://100093.pythonanywhere.com/api/get_workspaces/"),
        body: {"username": "$_username"});
    setState(
        () => workspaces = List<String>.from(json.decode(getWorkspaces.body)));
// orgList contains other_orgs names , ids and respected portfolios
    List<Map<String, dynamic>> orgList =
        List<Map<String, dynamic>>.from(JsonUserInfo["other_org"]);
//filtering orgList to get org_id, name and portfolio name and storing them in filteredOrgs
    for (int i = 0; i < workspaces.length; i++) {
      filteredOrgs = filteredOrgs +
          orgList
              .where((entry) => entry['org_name'] == '${workspaces[i]}')
              .map((entry) => {
                    'org_name': entry['org_name'],
                    'org_id': entry['org_id'],
                    'portfolio_name': entry['portfolio_name']
                  })
              .toList();
    }
//adding own org name and id in filtered Orgs
    filteredOrgs = filteredOrgs +
        [
          {
            'org_name': '$_username',
            'org_id': '${JsonUserInfo['userinfo']['client_admin_id']}',
          }
        ];
// adding own org name in worspaces that will shown in dropdown
    workspaces = workspaces..add('$_username');

// filtering portfolios from filtered Orgs  and portfolio_info(UserInfo Api)
    List<dynamic> _portfolios =
        filteredOrgs.map((map) => map["portfolio_name"]).toList();
    _portfolios = _portfolios +
        JsonUserInfo['portfolio_info']
            .map((map) => map["portfolio_name"])
            .toList();
    _portfolios.removeWhere((element) => element == null);
    portfolios = List.from(_portfolios);
    portfolios = portfolios.toSet().toList();
  }

  //login logics here
  Future<void> _login() async {
    final urlSessionId =
        Uri.parse('https://100014.pythonanywhere.com/api/mobilelogin/');
    var urlIP = Uri.parse('https://api.ipify.org?format=json');
    var urlUserInfo =
        Uri.parse('https://100014.pythonanywhere.com/api/userinfo/');
    var responseIP = await http.get(urlIP);

    late var ip;

    if (responseIP.statusCode == 200) {
      var data = jsonDecode(responseIP.body);
      ip = data['ip'];
    }

    ip = "127.0.0.1";
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

    String? sessionId = jsonResponse["session_id"];
    print(sessionId);
    if (jsonResponse['session_id'] != null) {
      final body2 = json.encode({'session_id': "$sessionId"});
      final getUserInfo = await http.post(urlUserInfo,
          body: body2, headers: {'Content-Type': 'application/json'});

      // userInfo = getUserInfo.body;
      JsonUserInfo = jsonDecode(getUserInfo.body);
    }

    if (jsonResponse['session_id'] != null) {
      var response = jsonResponse['session_id'];

      FFAppState().sessionId = sessionId.toString();
      await getWorkspaces();
      setState(() => isLoading = false);

      setState(() => _isError = false);
      setState(() => isLoggedIn = true);

      //  widget.navigateTo();
    } else {
      setState(() => isLoggedIn = false);
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
        isLoggedIn = false;
        setState(() => _isError = false);
        isIncorrectUserPass = false;
        _isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(18),
        child: isLoggedIn == true
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(JsonUserInfo['userinfo']
                          ['profile_img'] ??
                      'https://upload.wikimedia.org/wikipedia/commons/4/41/Profile-720.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(_username),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(53, 0, 0, 0),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      )
                    ],
                    border: Border.all(
                        color: Color.fromARGB(255, 47, 136, 50), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      underline: SizedBox(),
                      focusColor: Colors.white,
                      dropdownColor: Colors.white,
                      disabledHint: Text("Select Wokrspace",
                          style: TextStyle(color: Colors.black)),
                      hint: Text("Select Wokrspace",
                          style: TextStyle(color: Colors.black)),
                      value: selectedWorkspace,
                      onChanged: (newValue) {
                        setState(() => selectedWorkspace = newValue!);
                      },
                      items: workspaces
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.green,
                                    width: 5.0,
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.only(left: 10),
                              child: Text(value,
                                  style: TextStyle(color: Colors.black))),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                if (portfolios.length > 0)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(53, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                      border: Border.all(
                          color: Color.fromARGB(255, 47, 136, 50), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        disabledHint: Text("Select Portfolio",
                            style: TextStyle(color: Colors.black)),
                        hint: Text("Select Portfolio",
                            style: TextStyle(color: Colors.black)),
                        underline: SizedBox(),
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        value: selectedPortfolio,
                        onChanged: (newValue) {
                          setState(() => selectedPortfolio = newValue!);
                        },
                        items: portfolios
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.green,
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                                child: Text(value,
                                    style: TextStyle(color: Colors.black))),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    //filtering filterOrgs to get selected id of a workspace
                    dynamic id = filteredOrgs
                        .where((org) => org['org_name'] == selectedWorkspace)
                        .toList();
                    id = id[0]["org_id"];
                    Map<String, dynamic> _selectedValues = {
                      "selectedWorkspace": selectedWorkspace,
                      "selectedWorkspaceId": '$id',
                      "selectedPortfolio": selectedPortfolio,
                    };

                    // dynamic _response = userInfo.body + json.encode(_selectedValues);
                    dynamic _response = JsonUserInfo..addAll(_selectedValues);

                    // _response = jsonDecode(_response["selectedWorkspace"].toString());
                    FFAppState().response = _response;
                    print(_response);
                    widget.navigateTo();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    primary: Color(0xFF187B2B),
                  ),
                  child: isLoading == true
                      ? SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(color: Colors.white))
                      : Text('Continue  '),
                ),
              ])
            : Form(
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
                                onChanged: (val) =>
                                    setState(() => _password = val),
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
                                  top:
                                      isIncorrectUserPass == true ? 25.0 : 0.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() => isLoading = true);
                                  await _submitForm();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
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

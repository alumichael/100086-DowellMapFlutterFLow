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

// Begin custom widget coder

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({
    Key? key,
    this.width,
    this.height,
    required this.onHome,
    required this.onExit,
    required this.onPrivacy,
    required this.onSettings,
    required this.profileImg,
    required this.orgImg,
    this.sessionId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? sessionId;
  final Future<dynamic> Function() onHome;
  final Future<dynamic> Function() onExit;
  final Future<dynamic> Function() onPrivacy;
  final Future<dynamic> Function() onSettings;
  final String profileImg;
  final String orgImg;
  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: widget.sessionId == null || widget.sessionId!.length < 4
            ? Colors.red
            : const Color.fromARGB(255, 42, 131, 45),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
              onPressed: () {
                widget.onHome();
              },
              icon: Icon(Icons.home_outlined,
                  color: const Color.fromARGB(255, 237, 237, 237))),
          IconButton(
              onPressed: () {
                widget.onExit();
              },
              icon: Icon(Icons.exit_to_app,
                  color: const Color.fromARGB(255, 237, 237, 237))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '6',
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 237, 237, 237),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Learning",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 237, 237, 237),
                      fontSize: 13,
                    )),
                Text("Mode",
                    style: TextStyle(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 237, 237, 237)))
              ])
            ],
          ),
          IconButton(
              onPressed: () {
                widget.onPrivacy();
              },
              icon: Icon(Icons.security,
                  color: const Color.fromARGB(255, 237, 237, 237))),
          IconButton(
              onPressed: () {
                widget.onSettings();
              },
              icon: Icon(Icons.settings,
                  color: const Color.fromARGB(255, 237, 237, 237))),
          Container(
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  widget.orgImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  widget.profileImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]));
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

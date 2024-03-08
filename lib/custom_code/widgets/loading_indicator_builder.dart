// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatorBuilder extends StatefulWidget {
  const LoadingIndicatorBuilder({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _LoadingIndicatorBuilderState createState() =>
      _LoadingIndicatorBuilderState();
}

class _LoadingIndicatorBuilderState extends State<LoadingIndicatorBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [
            Color(0xff21633D),
            Color(0xff21633D).withOpacity(0.75),
            Color(0xff21633D).withOpacity(0.5),
            Color(0xff21633D).withOpacity(0.25)
          ],
          strokeWidth: 5,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.transparent),
    );
  }
}

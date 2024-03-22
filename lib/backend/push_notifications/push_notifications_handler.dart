import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/dowell_maps.png',
              width: MediaQuery.sizeOf(context).width * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'OnboardingPage': ParameterData.none(),
  'LoginComponent': ParameterData.none(),
  'placedetails': (data) async => ParameterData(
        allParams: {
          'ipAddress': getParameter<String>(data, 'ipAddress'),
          'sessionID': getParameter<String>(data, 'sessionID'),
          'currentCord': getParameter<String>(data, 'currentCord'),
        },
      ),
  'Signup': ParameterData.none(),
  'SelectOrg': ParameterData.none(),
  'NewHomePage': ParameterData.none(),
  'Userdetails': ParameterData.none(),
  'newplacedetails': (data) async => ParameterData(
        allParams: {
          'currentCord': getParameter<String>(data, 'currentCord'),
        },
      ),
  'TrackingPage': ParameterData.none(),
  'search': ParameterData.none(),
  'QrScanner': ParameterData.none(),
  'TrackingDetailsForm': (data) async {
    final allParams = {
      'userid': getParameter<String>(data, 'userid'),
      'workspaceid': getParameter<String>(data, 'workspaceid'),
    };
    return ParameterData(
      requiredParams: {
        'userid': serializeParam(
          allParams['userid'],
          ParamType.String,
        ),
        'workspaceid': serializeParam(
          allParams['workspaceid'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'Create_Qr_Code': ParameterData.none(),
  'TrackPermission': ParameterData.none(),
  'Teams': ParameterData.none(),
  'TeamMembers': (data) async => ParameterData(
        allParams: {
          'teamName': getParameter<String>(data, 'teamName'),
        },
      ),
  'MembersScreen': ParameterData.none(),
  'MembersDetailScreen': (data) async => ParameterData(
        allParams: {
          'teamName': getParameter<String>(data, 'teamName'),
        },
      ),
  'MembersSelectionScreen': (data) async => ParameterData(
        allParams: {
          'teamName': getParameter<String>(data, 'teamName'),
        },
      ),
  'AddMemberScreen': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

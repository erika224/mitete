import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

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

    safeSetState(() => _loading = true);
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
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/mitete__1_-removebg-preview.png',
            fit: BoxFit.contain,
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
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Splash': ParameterData.none(),
  'SignIn': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'Dashboard': ParameterData.none(),
  'Profile': ParameterData.none(),
  'mypage': ParameterData.none(),
  'Dogs': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
  'BookableDetail': (data) async => ParameterData(
        allParams: {
          'bookableRef': getParameter<DocumentReference>(data, 'bookableRef'),
        },
      ),
  'DogDetail': (data) async => ParameterData(
        allParams: {
          'dogRef': getParameter<DocumentReference>(data, 'dogRef'),
        },
      ),
  'AddDog': ParameterData.none(),
  'CreateProfile': ParameterData.none(),
  'bookListOwner': ParameterData.none(),
  'chatDetail': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chatList': ParameterData.none(),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'uploadPhoto': ParameterData.none(),
  'ownerHistory': ParameterData.none(),
  'registCreditCard': ParameterData.none(),
  'PaymentPage': (data) async => ParameterData(
        allParams: {
          'matchRef': getParameter<DocumentReference>(data, 'matchRef'),
        },
      ),
  'sitterHistory': ParameterData.none(),
  'bank': (data) async => ParameterData(
        allParams: {
          'matchRef': getParameter<DocumentReference>(data, 'matchRef'),
        },
      ),
  'register': ParameterData.none(),
  'bookListSitter': ParameterData.none(),
  'applyDetail': (data) async => ParameterData(
        allParams: {
          'matchRef': getParameter<DocumentReference>(data, 'matchRef'),
        },
      ),
  'ownerDetail': (data) async => ParameterData(
        allParams: {
          'ounerRef': getParameter<DocumentReference>(data, 'ounerRef'),
        },
      ),
  'OwnerDogDetail': (data) async => ParameterData(
        allParams: {
          'dogRef': getParameter<DocumentReference>(data, 'dogRef'),
        },
      ),
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

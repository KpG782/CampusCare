import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


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
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
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
          color: Color(0xFF19C5C5),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.none,
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
  'Verification_page': ParameterData.none(),
  'MyProfile_page': ParameterData.none(),
  'DataPolicy_page': ParameterData.none(),
  'DeleteAccount_page': ParameterData.none(),
  'EditProfile_page': ParameterData.none(),
  'TermsPolicies_page': ParameterData.none(),
  'TermsConditions_page': ParameterData.none(),
  'Discovery_page': ParameterData.none(),
  'Homepage': ParameterData.none(),
  'SelfHelp_page': (data) async => ParameterData(
        allParams: {
          'logs': getParameter<DocumentReference>(data, 'logs'),
        },
      ),
  'MentalResource_listStep1': ParameterData.none(),
  'AcademicSuccess_page': ParameterData.none(),
  'AcademicContent_2': ParameterData.none(),
  'Anxiety_page': ParameterData.none(),
  'Anxiety1': ParameterData.none(),
  'Anxiety2': ParameterData.none(),
  'Depression_page': ParameterData.none(),
  'Depression1': ParameterData.none(),
  'Depression2': ParameterData.none(),
  'Depression3': ParameterData.none(),
  'Message_page': ParameterData.none(),
  'Rico': ParameterData.none(),
  'Largadas': ParameterData.none(),
  'Borja': ParameterData.none(),
  'Bello': ParameterData.none(),
  'Obnamia': ParameterData.none(),
  'Updates_page': ParameterData.none(),
  'Peer': ParameterData.none(),
  'Notifications_page': ParameterData.none(),
  'Favourites_page': ParameterData.none(),
  'AppFeedbacks_page': ParameterData.none(),
  'chatPage': (data) async => ParameterData(
        allParams: {
          'receiveChat': getParameter<DocumentReference>(data, 'receiveChat'),
        },
      ),
  'CreateAccount1_page': ParameterData.none(),
  'AcademicContent_1': ParameterData.none(),
  'BLogin': ParameterData.none(),
  'ALogo': ParameterData.none(),
  'BLo': ParameterData.none(),
  'BLoginRegister': ParameterData.none(),
  'BLoginForgot': ParameterData.none(),
  'Emotional_page': ParameterData.none(),
  'Emotional1': ParameterData.none(),
  'Emotional2': ParameterData.none(),
  'Emotional3': ParameterData.none(),
  'Family_page': ParameterData.none(),
  'Family1': ParameterData.none(),
  'Suicidal_page': ParameterData.none(),
  'Grief_page': ParameterData.none(),
  'Grief1': ParameterData.none(),
  'Habits_page': ParameterData.none(),
  'Habits1': ParameterData.none(),
  'Substance_page': ParameterData.none(),
  'Trauma_page': ParameterData.none(),
  'Substance1': ParameterData.none(),
  'Substance2': ParameterData.none(),
  'Suicidal1': ParameterData.none(),
  'GrowthMindset1': ParameterData.none(),
  'CheckVerification_page': ParameterData.none(),
  'Mood_Logs': ParameterData.none(),
  'Session_page': ParameterData.none(),
  'Reservation_Page1': ParameterData.none(),
  'Onboarding_page1': ParameterData.none(),
  'Onboarding_page2': ParameterData.none(),
  'Onboarding_page3': ParameterData.none(),
  'Onboarding_page4': ParameterData.none(),
  'Onboarding_page5': ParameterData.none(),
  'mood_summary': ParameterData.none(),
  'Reservation_Page3': (data) async => ParameterData(
        allParams: {
          'classRef': getParameter<DocumentReference>(data, 'classRef'),
          'timeSelected': getParameter<DateTime>(data, 'timeSelected'),
          'ownerRef': getParameter<DocumentReference>(data, 'ownerRef'),
          'sessionType': getParameter<String>(data, 'sessionType'),
        },
      ),
  'MentalResource_listztry': ParameterData.none(),
  'Favourites_pageCopy': ParameterData.none(),
  'Breathe_Irritation': ParameterData.none(),
  'Reservation_Page2': (data) async => ParameterData(
        allParams: {
          'classRef': getParameter<DocumentReference>(data, 'classRef'),
          'sessionType': getParameter<String>(data, 'sessionType'),
        },
      ),
  'Discoverry1': (data) async => ParameterData(
        allParams: {
          'adminRef': getParameter<DocumentReference>(data, 'adminRef'),
        },
      ),
  'Roxas': ParameterData.none(),
  'Caguioa': ParameterData.none(),
  'MentalResource': ParameterData.none(),
  'AcademicContent_1Copy': ParameterData.none(),
  'Seminar': ParameterData.none(),
  'Account_pageCopy': ParameterData.none(),
  'BLoCopy': ParameterData.none(),
  'Verification_pageCopy': ParameterData.none(),
  'SessionFeedback_Page': ParameterData.none(),
  'Account_pageCopy2': ParameterData.none(),
  'Message_pageCopy2': ParameterData.none(),
  'SelfHelp_pageEmergencyCopy': (data) async => ParameterData(
        allParams: {
          'logs': getParameter<DocumentReference>(data, 'logs'),
        },
      ),
  'Reservation_Page1SOSCopy': ParameterData.none(),
  'Reservation_Page2SOSCopy': (data) async => ParameterData(
        allParams: {
          'classRef': getParameter<DocumentReference>(data, 'classRef'),
          'sessionType': getParameter<String>(data, 'sessionType'),
        },
      ),
  'Reservation_Page3SOSCopy': (data) async => ParameterData(
        allParams: {
          'classRef': getParameter<DocumentReference>(data, 'classRef'),
          'timeSelected': getParameter<DateTime>(data, 'timeSelected'),
          'ownerRef': getParameter<DocumentReference>(data, 'ownerRef'),
          'sessionType': getParameter<String>(data, 'sessionType'),
        },
      ),
  'DataPolicies_page': ParameterData.none(),
  'Discovery_pageEmergencyCopy': ParameterData.none(),
  'Mood_LogsCopy': ParameterData.none(),
  'Reservation_Page22': (data) async => ParameterData(
        allParams: {
          'classRef': getParameter<DocumentReference>(data, 'classRef'),
          'sessionType': getParameter<String>(data, 'sessionType'),
        },
      ),
  'Breathe_anxiety': ParameterData.none(),
  'Breathing_angry': ParameterData.none(),
  'Breathing_fear': ParameterData.none(),
  'Breathe_sad': ParameterData.none(),
  'Breathe_worried': ParameterData.none(),
  'MyProfile_pageCopy': ParameterData.none(),
  'GrowthMindset_page': ParameterData.none(),
  'Trauma1': ParameterData.none(),
  'GrowthMindset2': ParameterData.none(),
  'Motivation_page': ParameterData.none(),
  'Motivation1': ParameterData.none(),
  'Motivation2': ParameterData.none(),
  'Motivation3': ParameterData.none(),
  'Motivation4': ParameterData.none(),
  'PositivePsychology_page': ParameterData.none(),
  'PositivePsychology1': ParameterData.none(),
  'Confidence1': ParameterData.none(),
  'Confidence_page': ParameterData.none(),
  'mood_tracker1NewActivity': (data) async => ParameterData(
        allParams: {
          'date': getParameter<DateTime>(data, 'date'),
        },
      ),
  'mood_tracker2NewActivity': (data) async => ParameterData(
        allParams: {
          'date': getParameter<DateTime>(data, 'date'),
        },
      ),
  'Mood': ParameterData.none(),
  'mood_tracker3NewActivity': ParameterData.none(),
  'Breathe_energize': ParameterData.none(),
  'Breathe_deeprelax': ParameterData.none(),
  'Breath_calm': ParameterData.none(),
  'Breathe_joy': ParameterData.none(),
  'NEWS': (data) async => ParameterData(
        allParams: {
          'index': getParameter<DocumentReference>(data, 'index'),
          'titleIndex': getParameter<String>(data, 'titleIndex'),
        },
      ),
  'MentalResource_listz': ParameterData.none(),
  'MentalResource_listStep2': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'MentalResource_listStep3': (data) async => ParameterData(
        allParams: {
          'postTitle': getParameter<String>(data, 'postTitle'),
        },
      ),
  'mood_summaryCopy': ParameterData.none(),
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

import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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
      ? isWeb
          ? Container()
          : Container(
              color: Colors.transparent,
              child: Image.asset(
                'assets/images/Pamo_Connect_small_transparent.png',
                fit: BoxFit.fitWidth,
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
  'homePage': ParameterData.none(),
  'events': (data) async => ParameterData(
        allParams: {
          'draftsQuery': getParameter<String>(data, 'draftsQuery'),
        },
      ),
  'EditEvent': (data) async => ParameterData(
        allParams: {
          'cEvent': getParameter<DocumentReference>(data, 'cEvent'),
          'isCreate': getParameter<bool>(data, 'isCreate'),
          'previousDate': getParameter<DateTime>(data, 'previousDate'),
        },
      ),
  'selectAccountType': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'eventDetails': (data) async => ParameterData(
        allParams: {
          'eventDetails': getParameter<DocumentReference>(data, 'eventDetails'),
        },
      ),
  'assistanttt': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'connectCenter': (data) async => ParameterData(
        allParams: {
          'eve': getParameter<DocumentReference>(data, 'eve'),
          'isEdit': getParameter<String>(data, 'isEdit'),
        },
      ),
  'Addmission': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
        },
      ),
  'venue': (data) async => ParameterData(
        allParams: {
          'venueRef': getParameter<DocumentReference>(data, 'venueRef'),
        },
      ),
  'createVenue': ParameterData.none(),
  'venueDetails': (data) async => ParameterData(
        allParams: {
          'venue': getParameter<DocumentReference>(data, 'venue'),
        },
      ),
  'addPerformer': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
        },
      ),
  'profile': ParameterData.none(),
  'CreateEvent': (data) async => ParameterData(
        allParams: {
          'isCreate': getParameter<bool>(data, 'isCreate'),
        },
      ),
  'addVenue': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
        },
      ),
  'Settings': ParameterData.none(),
  'accountSettings': ParameterData.none(),
  'underConstruction': ParameterData.none(),
  'AccountDetails': ParameterData.none(),
  'testPage': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'AcceptInvite': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'bookingReq': getParameter<DocumentReference>(data, 'bookingReq'),
        },
      ),
  'NotificationsList': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'eventDetailsView': (data) async => ParameterData(
        allParams: {
          'eventDetails': getParameter<DocumentReference>(data, 'eventDetails'),
        },
      ),
  'AcceptRequest': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'DeletedPage': ParameterData.none(),
  'stats': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'loginPage': ParameterData.none(),
  'signUpPage': ParameterData.none(),
  'editVenue': (data) async => ParameterData(
        allParams: {
          'venueRef': getParameter<DocumentReference>(data, 'venueRef'),
        },
      ),
  'extraDetails': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'isEdit': getParameter<bool>(data, 'isEdit'),
        },
      ),
  'eventTickets': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'eventName': getParameter<String>(data, 'eventName'),
        },
      ),
  'GenerateTicketPage': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'eventName': getParameter<String>(data, 'eventName'),
          'ticketName': getParameter<String>(data, 'ticketName'),
          'ticketPrice': getParameter<double>(data, 'ticketPrice'),
          'ticketRef': getParameter<DocumentReference>(data, 'ticketRef'),
        },
      ),
  'performerHome': ParameterData.none(),
  'editPerformerP': ParameterData.none(),
  'addVenuekeep': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
        },
      ),
  'chat_ai_Screen': ParameterData.none(),
  'payments': ParameterData.none(),
  'promoCodes': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'List10OrderHistory': ParameterData.none(),
  'assistantttCopy': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'underConstructionCopy': ParameterData.none(),
  'support_TicketList': ParameterData.none(),
  'support_SubmitTicket': ParameterData.none(),
  'support_TicketDetails': (data) async => ParameterData(
        allParams: {
          'ticketRef': await getDocumentParameter<SupportTicketsRecord>(
              data, 'ticketRef', SupportTicketsRecord.fromSnapshot),
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

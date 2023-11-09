// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> createTicket(
  String? ticketPrice,
  String? ticket,
  String? description,
  String? collectionName,
  String? subcollectionName,
  DocumentReference mainDoc,
) async {
  // null check
  ticketPrice ??= 'error';
  ticket ??= 'error';
  description ??= 'error';
  collectionName ??= '';
  subcollectionName ??= '';

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the subcollection
  final subcollectionRef = firestore
      .collection(collectionName)
      .doc(
          '$mainDoc') // Replace 'documentId' with the ID of the document that contains the subcollection
      .collection(subcollectionName);

  // Create a new document in the subcollection
  final doc = {
    'ticket_price': ticketPrice,
    'ticket': ticket,
    'description': description,
  };
  await subcollectionRef.add(doc);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

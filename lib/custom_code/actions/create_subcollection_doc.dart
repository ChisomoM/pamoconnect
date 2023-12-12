// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> createSubcollectionDoc(
  double? ticketPrice,
  String? ticket,
  String? description,
  String? collectionName,
  String? parentDocumentId,
) async {
  // Null check and set default values
  ticketPrice ??= 0;
  ticket ??= '';
  description ??= '';
  collectionName ??= '';
  parentDocumentId ??= '';

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the parent document
  final parentDocRef =
      firestore.collection(collectionName).doc(parentDocumentId);

  // Get a reference to the subcollection
  final subcollectionRef = parentDocRef.collection('tickets');

  // Create a new document with the specified data
  final doc = {
    'ticket_price': ticketPrice,
    'ticket_name': ticket,
    'ticket_description': description,
  };

  // Add the document to the subcollection
  await subcollectionRef.add(doc);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

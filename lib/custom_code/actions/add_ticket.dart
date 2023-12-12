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

// Future addTicket(
//   String? ticketName,
//   String? description,
//   double? price,
//   String? ticketN,
//   String? desc,
//   double? tPrice,
//   // String? fieldName3,
//   // String? fieldValue1,
//   // DateTime? fieldValue2,
//   // String? fieldValue3,
//   String? collectionName,
// ) async {
//   // null check
//   ticketName ??= 'error';
//   description ??= 'error';
//   price ??= 0;
//   ticketN = ticketN ?? '';
//   desc = desc ?? '';
//   tPrice = tPrice ?? 0;
//   // fieldName3 ??= 'error';
//   // fieldValue1 = fieldValue1 ?? '';
//   // fieldValue2 = fieldValue2 ?? DateTime.now();
//   // fieldValue3 = fieldValue3 ?? '';
//   collectionName = collectionName ?? '';

//   // Get a reference to the Firestore database
//   final firestore = FirebaseFirestore.instance;

//   // Get a reference to the collection
//   final collectionRef = firestore.collection(collectionName);

//   // old code
//   // final doc = createOrdersRecordData(name: fieldValue1, date: fieldValue2, orderid: fieldValue3);

//   // new code
//   final doc = {
//     ticketName: ticketN,
//     description: desc,
//     price: tPrice,
//   };

//   // TODO: change fields you want to search for
//   final docFilter =
//       await collectionRef.where('ticket_name', isEqualTo: ticketN).get();

//   if (docFilter.docs.isNotEmpty) {
//     // Update the existing document with the new data
//     await docFilter.docs.first.reference.update(doc);
//   } else {
//     // Add a new document to the collectionHello ,
//     // Hello ,

//     await collectionRef.add(doc);
//   }
// }
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

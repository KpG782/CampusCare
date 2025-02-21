// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> refreshPage(BuildContext context) async {
  // Trigger a reload of the current FlutterFlow page
  await Future.delayed(Duration.zero); // Allow some delay
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => context.widget, // Rebuild the current page
    ),
  );
}

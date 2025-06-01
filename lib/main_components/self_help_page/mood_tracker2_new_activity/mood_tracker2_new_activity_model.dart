import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mood_tracker2_new_activity_widget.dart'
    show MoodTracker2NewActivityWidget;
import 'package:flutter/material.dart';

class MoodTracker2NewActivityModel
    extends FlutterFlowModel<MoodTracker2NewActivityWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtYourDay widget.
  FocusNode? txtYourDayFocusNode;
  TextEditingController? txtYourDayTextController;
  String? Function(BuildContext, String?)? txtYourDayTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSentiment)] action in Button widget.
  ApiCallResponse? outputSentiment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtYourDayFocusNode?.dispose();
    txtYourDayTextController?.dispose();
  }
}

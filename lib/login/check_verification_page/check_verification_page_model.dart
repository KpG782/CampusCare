import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'check_verification_page_widget.dart' show CheckVerificationPageWidget;
import 'package:flutter/material.dart';

class CheckVerificationPageModel
    extends FlutterFlowModel<CheckVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'b_login_forgot_widget.dart' show BLoginForgotWidget;
import 'package:flutter/material.dart';

class BLoginForgotModel extends FlutterFlowModel<BLoginForgotWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Kindly use a valid UMak Email Address.';
    }

    if (!RegExp(
            '(?!.*@outlook\\.com|.*@gmail\\.com|.*@yahoo\\.com)(\\w[\\w\\.]*@\\w+\\.[\\w\\.]+)')
        .hasMatch(val)) {
      return 'Kindly use a valid UMak Email Address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}

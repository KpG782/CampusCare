import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'b_login_register_widget.dart' show BLoginRegisterWidget;
import 'package:flutter/material.dart';

class BLoginRegisterModel extends FlutterFlowModel<BLoginRegisterWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SemailAddress widget.
  FocusNode? semailAddressFocusNode;
  TextEditingController? semailAddressTextController;
  String? Function(BuildContext, String?)? semailAddressTextControllerValidator;
  String? _semailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please use a valid UMak Email Address.';
    }

    if (!RegExp(
            '(?!.*@outlook\\.com|.*@gmail\\.com|.*@yahoo\\.com)(\\w[\\w\\.]*@\\w+\\.[\\w\\.]+)')
        .hasMatch(val)) {
      return 'Please use a valid UMak Email Address.';
    }
    return null;
  }

  // State field(s) for Spassword widget.
  FocusNode? spasswordFocusNode;
  TextEditingController? spasswordTextController;
  late bool spasswordVisibility;
  String? Function(BuildContext, String?)? spasswordTextControllerValidator;
  String? _spasswordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for SconfirmPassword widget.
  FocusNode? sconfirmPasswordFocusNode;
  TextEditingController? sconfirmPasswordTextController;
  late bool sconfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      sconfirmPasswordTextControllerValidator;
  String? _sconfirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    semailAddressTextControllerValidator =
        _semailAddressTextControllerValidator;
    spasswordVisibility = false;
    spasswordTextControllerValidator = _spasswordTextControllerValidator;
    sconfirmPasswordVisibility = false;
    sconfirmPasswordTextControllerValidator =
        _sconfirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    semailAddressFocusNode?.dispose();
    semailAddressTextController?.dispose();

    spasswordFocusNode?.dispose();
    spasswordTextController?.dispose();

    sconfirmPasswordFocusNode?.dispose();
    sconfirmPasswordTextController?.dispose();
  }
}

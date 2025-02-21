import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reservation_page3_s_o_s_copy_widget.dart'
    show ReservationPage3SOSCopyWidget;
import 'package:flutter/material.dart';

class ReservationPage3SOSCopyModel
    extends FlutterFlowModel<ReservationPage3SOSCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

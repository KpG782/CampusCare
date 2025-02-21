import '/flutter_flow/flutter_flow_util.dart';
import 'logtesting_widget.dart' show LogtestingWidget;
import 'package:flutter/material.dart';

class LogtestingModel extends FlutterFlowModel<LogtestingWidget> {
  ///  Local state fields for this component.

  bool editText = true;

  ///  State fields for stateful widgets in this component.

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

import '/flutter_flow/flutter_flow_util.dart';
import 'log_component_widget.dart' show LogComponentWidget;
import 'package:flutter/material.dart';

class LogComponentModel extends FlutterFlowModel<LogComponentWidget> {
  ///  Local state fields for this component.

  bool editMode = true;

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

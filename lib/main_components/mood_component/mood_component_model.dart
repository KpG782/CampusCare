import '/flutter_flow/flutter_flow_util.dart';
import 'mood_component_widget.dart' show MoodComponentWidget;
import 'package:flutter/material.dart';

class MoodComponentModel extends FlutterFlowModel<MoodComponentWidget> {
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

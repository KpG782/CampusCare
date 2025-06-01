import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_account1_page_widget.dart' show CreateAccount1PageWidget;
import 'package:flutter/material.dart';

class CreateAccount1PageModel
    extends FlutterFlowModel<CreateAccount1PageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData1mc = false;
  FFUploadedFile uploadedLocalFile_uploadData1mc =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData1mc = '';

  // State field(s) for txtUserName widget.
  FocusNode? txtUserNameFocusNode;
  TextEditingController? txtUserNameTextController;
  String? Function(BuildContext, String?)? txtUserNameTextControllerValidator;
  // State field(s) for txtUserDept widget.
  String? txtUserDeptValue;
  FormFieldController<String>? txtUserDeptValueController;
  // State field(s) for txtUserBio widget.
  FocusNode? txtUserBioFocusNode;
  TextEditingController? txtUserBioTextController;
  String? Function(BuildContext, String?)? txtUserBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtUserNameFocusNode?.dispose();
    txtUserNameTextController?.dispose();

    txtUserBioFocusNode?.dispose();
    txtUserBioTextController?.dispose();
  }
}

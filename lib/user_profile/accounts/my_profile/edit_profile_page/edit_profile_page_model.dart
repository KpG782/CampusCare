import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_page_widget.dart' show EditProfilePageWidget;
import 'package:flutter/material.dart';

class EditProfilePageModel extends FlutterFlowModel<EditProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_userPhoto = false;
  FFUploadedFile uploadedLocalFile_userPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_userPhoto = '';

  // State field(s) for txtUName widget.
  FocusNode? txtUNameFocusNode;
  TextEditingController? txtUNameTextController;
  String? Function(BuildContext, String?)? txtUNameTextControllerValidator;
  // State field(s) for txtUBio widget.
  FocusNode? txtUBioFocusNode;
  TextEditingController? txtUBioTextController;
  String? Function(BuildContext, String?)? txtUBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtUNameFocusNode?.dispose();
    txtUNameTextController?.dispose();

    txtUBioFocusNode?.dispose();
    txtUBioTextController?.dispose();
  }
}

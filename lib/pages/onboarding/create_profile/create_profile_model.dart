import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for fullname_field widget.
  FocusNode? fullnameFieldFocusNode;
  TextEditingController? fullnameFieldTextController;
  String? Function(BuildContext, String?)? fullnameFieldTextControllerValidator;
  // State field(s) for name_edit_field widget.
  FocusNode? nameEditFieldFocusNode;
  TextEditingController? nameEditFieldTextController;
  String? Function(BuildContext, String?)? nameEditFieldTextControllerValidator;
  // State field(s) for description_edit_field widget.
  FocusNode? descriptionEditFieldFocusNode;
  TextEditingController? descriptionEditFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionEditFieldTextControllerValidator;
  // State field(s) for phoneNo_edit_Field widget.
  FocusNode? phoneNoEditFieldFocusNode;
  TextEditingController? phoneNoEditFieldTextController;
  String? Function(BuildContext, String?)?
      phoneNoEditFieldTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for shopurl_edit_Field widget.
  FocusNode? shopurlEditFieldFocusNode;
  TextEditingController? shopurlEditFieldTextController;
  String? Function(BuildContext, String?)?
      shopurlEditFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullnameFieldFocusNode?.dispose();
    fullnameFieldTextController?.dispose();

    nameEditFieldFocusNode?.dispose();
    nameEditFieldTextController?.dispose();

    descriptionEditFieldFocusNode?.dispose();
    descriptionEditFieldTextController?.dispose();

    phoneNoEditFieldFocusNode?.dispose();
    phoneNoEditFieldTextController?.dispose();

    shopurlEditFieldFocusNode?.dispose();
    shopurlEditFieldTextController?.dispose();
  }
}

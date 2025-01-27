import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name_edit_Field widget.
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
  // State field(s) for email_edit_Field widget.
  FocusNode? emailEditFieldFocusNode;
  TextEditingController? emailEditFieldTextController;
  String? Function(BuildContext, String?)?
      emailEditFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    nameEditFieldFocusNode?.dispose();
    nameEditFieldTextController?.dispose();

    descriptionEditFieldFocusNode?.dispose();
    descriptionEditFieldTextController?.dispose();

    phoneNoEditFieldFocusNode?.dispose();
    phoneNoEditFieldTextController?.dispose();

    emailEditFieldFocusNode?.dispose();
    emailEditFieldTextController?.dispose();
  }
}

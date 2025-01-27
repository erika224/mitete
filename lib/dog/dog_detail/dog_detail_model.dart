import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dog_detail_widget.dart' show DogDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DogDetailModel extends FlutterFlowModel<DogDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dog_name_edit_Field widget.
  FocusNode? dogNameEditFieldFocusNode;
  TextEditingController? dogNameEditFieldTextController;
  String? Function(BuildContext, String?)?
      dogNameEditFieldTextControllerValidator;
  // State field(s) for dog_description_edit_field widget.
  FocusNode? dogDescriptionEditFieldFocusNode;
  TextEditingController? dogDescriptionEditFieldTextController;
  String? Function(BuildContext, String?)?
      dogDescriptionEditFieldTextControllerValidator;
  // State field(s) for dog_birthday_edit_Field widget.
  FocusNode? dogBirthdayEditFieldFocusNode;
  TextEditingController? dogBirthdayEditFieldTextController;
  final dogBirthdayEditFieldMask = MaskTextInputFormatter(mask: '########');
  String? Function(BuildContext, String?)?
      dogBirthdayEditFieldTextControllerValidator;
  // State field(s) for dog_weight_edit_Field widget.
  FocusNode? dogWeightEditFieldFocusNode;
  TextEditingController? dogWeightEditFieldTextController;
  String? Function(BuildContext, String?)?
      dogWeightEditFieldTextControllerValidator;
  // State field(s) for dog_kind_edit_Field widget.
  FocusNode? dogKindEditFieldFocusNode;
  TextEditingController? dogKindEditFieldTextController;
  String? Function(BuildContext, String?)?
      dogKindEditFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    dogNameEditFieldFocusNode?.dispose();
    dogNameEditFieldTextController?.dispose();

    dogDescriptionEditFieldFocusNode?.dispose();
    dogDescriptionEditFieldTextController?.dispose();

    dogBirthdayEditFieldFocusNode?.dispose();
    dogBirthdayEditFieldTextController?.dispose();

    dogWeightEditFieldFocusNode?.dispose();
    dogWeightEditFieldTextController?.dispose();

    dogKindEditFieldFocusNode?.dispose();
    dogKindEditFieldTextController?.dispose();
  }
}

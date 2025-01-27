import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'add_dog_widget.dart' show AddDogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AddDogModel extends FlutterFlowModel<AddDogWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for DogName widget.
  FocusNode? dogNameFocusNode;
  TextEditingController? dogNameTextController;
  String? Function(BuildContext, String?)? dogNameTextControllerValidator;
  String? _dogNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'おなまえは必須です';
    }

    return null;
  }

  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '重さは必須です';
    }

    return null;
  }

  // State field(s) for Birthday widget.
  FocusNode? birthdayFocusNode;
  TextEditingController? birthdayTextController;
  final birthdayMask = MaskTextInputFormatter(mask: '########');
  String? Function(BuildContext, String?)? birthdayTextControllerValidator;
  String? _birthdayTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '誕生日は必須です';
    }

    if (!RegExp('^\\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])\$')
        .hasMatch(val)) {
      return '入力内容をご確認ください';
    }
    return null;
  }

  // State field(s) for dogKind widget.
  FocusNode? dogKindFocusNode;
  TextEditingController? dogKindTextController;
  String? Function(BuildContext, String?)? dogKindTextControllerValidator;
  String? _dogKindTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '犬種は必須です';
    }

    return null;
  }

  // State field(s) for dogDescription widget.
  FocusNode? dogDescriptionFocusNode;
  TextEditingController? dogDescriptionTextController;
  String? Function(BuildContext, String?)?
      dogDescriptionTextControllerValidator;
  String? _dogDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return '紹介文を入力してください';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    dogNameTextControllerValidator = _dogNameTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
    birthdayTextControllerValidator = _birthdayTextControllerValidator;
    dogKindTextControllerValidator = _dogKindTextControllerValidator;
    dogDescriptionTextControllerValidator =
        _dogDescriptionTextControllerValidator;
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    dogNameFocusNode?.dispose();
    dogNameTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    birthdayFocusNode?.dispose();
    birthdayTextController?.dispose();

    dogKindFocusNode?.dispose();
    dogKindTextController?.dispose();

    dogDescriptionFocusNode?.dispose();
    dogDescriptionTextController?.dispose();
  }
}

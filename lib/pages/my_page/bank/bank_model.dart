import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/component/custom_appbar/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'bank_widget.dart' show BankWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BankModel extends FlutterFlowModel<BankWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // State field(s) for bank_name widget.
  FocusNode? bankNameFocusNode;
  TextEditingController? bankNameTextController;
  String? Function(BuildContext, String?)? bankNameTextControllerValidator;
  // State field(s) for branch_name widget.
  FocusNode? branchNameFocusNode;
  TextEditingController? branchNameTextController;
  String? Function(BuildContext, String?)? branchNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for account_number widget.
  FocusNode? accountNumberFocusNode;
  TextEditingController? accountNumberTextController;
  late bool accountNumberVisibility;
  final accountNumberMask = MaskTextInputFormatter(mask: '#######');
  String? Function(BuildContext, String?)? accountNumberTextControllerValidator;
  // State field(s) for account_name widget.
  FocusNode? accountNameFocusNode;
  TextEditingController? accountNameTextController;
  String? Function(BuildContext, String?)? accountNameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    accountNumberVisibility = false;
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    bankNameFocusNode?.dispose();
    bankNameTextController?.dispose();

    branchNameFocusNode?.dispose();
    branchNameTextController?.dispose();

    accountNumberFocusNode?.dispose();
    accountNumberTextController?.dispose();

    accountNameFocusNode?.dispose();
    accountNameTextController?.dispose();
  }
}

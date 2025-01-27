import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/component/empty_state/empty_state_widget.dart';
import '/component/select_cities/select_cities_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/search/never_auth_overlay/never_auth_overlay_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'register_widget.dart' show RegisterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for setPref widget.
  String? setPrefValue;
  FormFieldController<String>? setPrefValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  BookableRecord? firestoreCollection;
  // Model for neverAuthOverlay component.
  late NeverAuthOverlayModel neverAuthOverlayModel;

  @override
  void initState(BuildContext context) {
    neverAuthOverlayModel = createModel(context, () => NeverAuthOverlayModel());
  }

  @override
  void dispose() {
    neverAuthOverlayModel.dispose();
  }
}

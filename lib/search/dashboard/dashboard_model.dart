import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/empty_state/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/search/never_auth_overlay/never_auth_overlay_widget.dart';
import '/search/prefecture_selection/prefecture_selection_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

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

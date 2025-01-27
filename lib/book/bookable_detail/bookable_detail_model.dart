import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/book/booking_confirm_modal/booking_confirm_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'bookable_detail_widget.dart' show BookableDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookableDetailModel extends FlutterFlowModel<BookableDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BookingConfirmModal component.
  late BookingConfirmModalModel bookingConfirmModalModel;

  @override
  void initState(BuildContext context) {
    bookingConfirmModalModel =
        createModel(context, () => BookingConfirmModalModel());
  }

  @override
  void dispose() {
    bookingConfirmModalModel.dispose();
  }
}

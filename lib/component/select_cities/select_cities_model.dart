import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'select_cities_widget.dart' show SelectCitiesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectCitiesModel extends FlutterFlowModel<SelectCitiesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

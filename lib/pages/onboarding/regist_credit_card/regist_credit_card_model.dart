import '/component/custom_appbar/custom_appbar_widget.dart';
import '/components/credit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/my_page/change_card/change_card_widget.dart';
import 'dart:ui';
import 'regist_credit_card_widget.dart' show RegistCreditCardWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistCreditCardModel extends FlutterFlowModel<RegistCreditCardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // Model for credit component.
  late CreditModel creditModel;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    creditModel = createModel(context, () => CreditModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    creditModel.dispose();
  }
}

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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'bank_model.dart';
export 'bank_model.dart';

class BankWidget extends StatefulWidget {
  const BankWidget({
    super.key,
    required this.matchRef,
  });

  final DocumentReference? matchRef;

  @override
  State<BankWidget> createState() => _BankWidgetState();
}

class _BankWidgetState extends State<BankWidget> {
  late BankModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bank'});

    _model.bankNameFocusNode ??= FocusNode();

    _model.branchNameFocusNode ??= FocusNode();

    _model.accountNumberFocusNode ??= FocusNode();

    _model.accountNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.customAppbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CustomAppbarWidget(
                    backButton: false,
                    actionButton: true,
                    optionsButton: false,
                    actionButtonAction: () async {
                      logFirebaseEvent('BANK_PAGE_Container_ivk4xuca_CALLBACK');
                      logFirebaseEvent('customAppbar_navigate_to');

                      context.pushNamed('sitterHistory');
                    },
                    optionsButtonAction: () async {},
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 20.0, 0.0),
                  child: StreamBuilder<List<BankInfoRecord>>(
                    stream: queryBankInfoRecord(
                      parent: currentUserReference,
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<BankInfoRecord> columnBankInfoRecordList =
                          snapshot.data!;
                      final columnBankInfoRecord =
                          columnBankInfoRecordList.isNotEmpty
                              ? columnBankInfoRecordList.first
                              : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Text(
                              'お振込先登録',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              '誤りがないようご確認おねがいいたします',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Text(
                              '銀行名',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.bankNameTextController ??=
                                  TextEditingController(
                                text: columnBankInfoRecord?.bankName,
                              ),
                              focusNode: _model.bankNameFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'BANK_PAGE_bank_name_ON_TEXTFIELD_SUBMIT');
                                logFirebaseEvent('bank_name_backend_call');

                                await columnBankInfoRecord!.reference
                                    .update(createBankInfoRecordData(
                                  bankName: _model.bankNameTextController.text,
                                ));
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: '○○銀行',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.bankNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              '支店名',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.branchNameTextController ??=
                                  TextEditingController(
                                text: columnBankInfoRecord?.branchName,
                              ),
                              focusNode: _model.branchNameFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'BANK_branch_name_ON_TEXTFIELD_SUBMIT');
                                logFirebaseEvent('branch_name_backend_call');

                                await columnBankInfoRecord!.reference
                                    .update(createBankInfoRecordData(
                                  branchName:
                                      _model.branchNameTextController.text,
                                ));
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: '○○支店',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .branchNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Text(
                              '口座種別 ／ 口座番号',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??=
                                        columnBankInfoRecord?.accountType,
                                  ),
                                  options: ['普通', '当座', 'その他'],
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue = val);
                                    logFirebaseEvent(
                                        'BANK_DropDown_p5cmpcrt_ON_FORM_WIDGET_SE');
                                    logFirebaseEvent('DropDown_backend_call');

                                    await columnBankInfoRecord!.reference
                                        .update(createBankInfoRecordData(
                                      accountType: _model.dropDownValue,
                                    ));
                                  },
                                  width: 100.0,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Select...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model
                                                .accountNumberTextController ??=
                                            TextEditingController(
                                          text: columnBankInfoRecord
                                              ?.accountNumber
                                              ?.toString(),
                                        ),
                                        focusNode:
                                            _model.accountNumberFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'BANK_account_number_ON_TEXTFIELD_SUBMIT');
                                          logFirebaseEvent(
                                              'account_number_backend_call');

                                          await columnBankInfoRecord!.reference
                                              .update(createBankInfoRecordData(
                                            accountNumber: int.tryParse(_model
                                                .accountNumberTextController
                                                .text),
                                          ));
                                        },
                                        autofocus: false,
                                        obscureText:
                                            !_model.accountNumberVisibility,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto Sans JP',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '半角数字 7桁',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Noto Sans JP',
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () => safeSetState(
                                              () => _model
                                                      .accountNumberVisibility =
                                                  !_model
                                                      .accountNumberVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.accountNumberVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans JP',
                                              letterSpacing: 0.0,
                                            ),
                                        maxLength: 7,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .accountNumberTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.accountNumberMask
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '口座名義',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans JP',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.accountNameTextController ??=
                                  TextEditingController(
                                text: columnBankInfoRecord?.accountName,
                              ),
                              focusNode: _model.accountNameFocusNode,
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'BANK_account_name_ON_TEXTFIELD_SUBMIT');
                                logFirebaseEvent('account_name_backend_call');

                                await columnBankInfoRecord!.reference
                                    .update(createBankInfoRecordData(
                                  accountName:
                                      _model.accountNameTextController.text,
                                ));
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'カタカナ',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .accountNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: FFButtonWidget(
                        onPressed: ((_model.bankNameTextController.text ==
                                        null ||
                                    _model.bankNameTextController.text == '') ||
                                (_model.branchNameTextController.text == null ||
                                    _model.branchNameTextController.text ==
                                        '') ||
                                (_model.dropDownValue == null ||
                                    _model.dropDownValue == '') ||
                                (_model.accountNumberTextController.text ==
                                        null ||
                                    _model.accountNumberTextController.text ==
                                        '') ||
                                (_model.accountNameTextController.text ==
                                        null ||
                                    _model.accountNameTextController.text ==
                                        ''))
                            ? null
                            : () async {
                                logFirebaseEvent('BANK_PAGE__BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await widget!.matchRef!
                                    .update(createMatchRecordData(
                                  status: MatchStatus.payRequest,
                                ));
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('完了'),
                                      content: Text('依頼しました。入金までお待ちください。'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('sitterHistory');
                              },
                        text: '振込依頼',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Noto Sans JP',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

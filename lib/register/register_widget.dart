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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_model.dart';
export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'register'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REGISTER_PAGE_register_ON_INIT_STATE');
      logFirebaseEvent('register_update_app_state');
      FFAppState().selectedDate = functions.dateTimetoday(getCurrentTimestamp);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          final days = FFAppConstants.Days.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(days.length, (daysIndex) {
                                final daysItem = days[daysIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'REGISTER_PAGE_Container_k1rpag3h_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_update_app_state');
                                      FFAppState().selectedDate =
                                          functions.dateTimetoday(
                                              functions.addDaysToDate(
                                                  getCurrentTimestamp,
                                                  daysItem));
                                      FFAppState().startTime = null;
                                      FFAppState().endTime = null;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FFAppState().selectedDate ==
                                                functions.dateTimetoday(
                                                    functions.addDaysToDate(
                                                        getCurrentTimestamp,
                                                        daysItem))
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .accent4,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                              "dd",
                                              functions.addDaysToDate(
                                                  getCurrentTimestamp,
                                                  daysItem),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              functions.getWeekFromDate(
                                                  functions.addDaysToDate(
                                                      getCurrentTimestamp,
                                                      daysItem)),
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                                  .divide(SizedBox(width: 8.0))
                                  .around(SizedBox(width: 8.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: GetPrefectureCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final setPrefGetPrefectureResponse =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .setPrefValueController ??=
                                                FormFieldController<String>(
                                              _model.setPrefValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                (getJsonField(
                                              setPrefGetPrefectureResponse
                                                  .jsonBody,
                                              r'''$.result[:].prefCode''',
                                              true,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!),
                                            optionLabels: (getJsonField(
                                              setPrefGetPrefectureResponse
                                                  .jsonBody,
                                              r'''$.result[:].prefName''',
                                              true,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.setPrefValue = val);
                                              logFirebaseEvent(
                                                  'REGISTER_setPref_ON_FORM_WIDGET_SELECTED');
                                              logFirebaseEvent(
                                                  'setPref_update_app_state');
                                              FFAppState().selectPrefCode =
                                                  _model.setPrefValue!;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'setPref_update_app_state');
                                              FFAppState().apiResponceBody =
                                                  setPrefGetPrefectureResponse
                                                      .jsonBody
                                                      .toString();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'setPref_update_app_state');
                                              FFAppState().selectCities = [];
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'setPref_update_app_state');
                                              FFAppState().selectedPref =
                                                  functions
                                                      .findPrefNameFromResponse(
                                                          FFAppState()
                                                              .apiResponceBody,
                                                          FFAppState()
                                                              .selectPrefCode)!;
                                              safeSetState(() {});
                                            },
                                            width: 200.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Noto Sans JP',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: '都道府県を選択',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'REGISTER_PAGE_Container_3cg7c1dd_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SelectCitiesWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: 150.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions.convertListToText(
                                                    FFAppState()
                                                        .selectCities
                                                        .toList()),
                                                '市区町村を選択',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans JP',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'REGISTER_PAGE_start_ON_TAP');
                                        logFirebaseEvent(
                                            'start_date_time_picker');
                                        await showModalBottomSheet<bool>(
                                            context: context,
                                            builder: (context) {
                                              final _datePicked1CupertinoTheme =
                                                  CupertinoTheme.of(context);
                                              return ScrollConfiguration(
                                                behavior:
                                                    const MaterialScrollBehavior()
                                                        .copyWith(
                                                  dragDevices: {
                                                    PointerDeviceKind.mouse,
                                                    PointerDeviceKind.touch,
                                                    PointerDeviceKind.stylus,
                                                    PointerDeviceKind.unknown
                                                  },
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  child: CupertinoTheme(
                                                    data:
                                                        _datePicked1CupertinoTheme
                                                            .copyWith(
                                                      textTheme:
                                                          _datePicked1CupertinoTheme
                                                              .textTheme
                                                              .copyWith(
                                                        dateTimePickerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans JP',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    child: CupertinoDatePicker(
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .time,
                                                      minimumDate:
                                                          DateTime(1900),
                                                      initialDateTime:
                                                          getCurrentTimestamp,
                                                      maximumDate:
                                                          DateTime(2050),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      use24hFormat: false,
                                                      onDateTimeChanged:
                                                          (newDateTime) =>
                                                              safeSetState(() {
                                                        _model.datePicked1 =
                                                            newDateTime;
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                        logFirebaseEvent(
                                            'start_update_app_state');
                                        FFAppState().startTime =
                                            _model.datePicked1;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "Hm",
                                                FFAppState().startTime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '開始時間',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '～',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans JP',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'REGISTER_PAGE_end_ON_TAP');
                                        logFirebaseEvent(
                                            'end_date_time_picker');
                                        await showModalBottomSheet<bool>(
                                            context: context,
                                            builder: (context) {
                                              final _datePicked2CupertinoTheme =
                                                  CupertinoTheme.of(context);
                                              return ScrollConfiguration(
                                                behavior:
                                                    const MaterialScrollBehavior()
                                                        .copyWith(
                                                  dragDevices: {
                                                    PointerDeviceKind.mouse,
                                                    PointerDeviceKind.touch,
                                                    PointerDeviceKind.stylus,
                                                    PointerDeviceKind.unknown
                                                  },
                                                ),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  child: CupertinoTheme(
                                                    data:
                                                        _datePicked2CupertinoTheme
                                                            .copyWith(
                                                      textTheme:
                                                          _datePicked2CupertinoTheme
                                                              .textTheme
                                                              .copyWith(
                                                        dateTimePickerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans JP',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    child: CupertinoDatePicker(
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .time,
                                                      minimumDate:
                                                          DateTime(1900),
                                                      initialDateTime:
                                                          getCurrentTimestamp,
                                                      maximumDate:
                                                          DateTime(2050),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      use24hFormat: false,
                                                      onDateTimeChanged:
                                                          (newDateTime) =>
                                                              safeSetState(() {
                                                        _model.datePicked2 =
                                                            newDateTime;
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                        logFirebaseEvent(
                                            'end_update_app_state');
                                        FFAppState().endTime =
                                            _model.datePicked2;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "Hm",
                                                FFAppState().endTime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '終了時間',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'REGISTER_PAGE__BTN_ON_TAP');
                                    logFirebaseEvent('Button_firestore_query');
                                    _model.firestoreCollection =
                                        await queryBookableRecordOnce(
                                      queryBuilder: (bookableRecord) =>
                                          bookableRecord
                                              .where(
                                                'sitter_id',
                                                isEqualTo: currentUserUid,
                                              )
                                              .where(
                                                'date',
                                                isEqualTo: FFAppState()
                                                    .selectedDate
                                                    ?.toString(),
                                              ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (functions.isTimeWithinRange(
                                        _model.firestoreCollection?.startTime,
                                        _model.firestoreCollection?.endTime,
                                        FFAppState().startTime,
                                        FFAppState().endTime)) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('入力エラー'),
                                            content: Text('入力時間がすでに登録されています'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if ((FFAppState().selectedPref ==
                                                null ||
                                            FFAppState().selectedPref == '') &&
                                        !(FFAppState()
                                            .selectCities
                                            .isNotEmpty)) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('入力エラー'),
                                            content: Text('未選択項目があります'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (valueOrDefault<bool>(
                                          functions.convertDatetimeToString(
                                                      FFAppState().startTime) ==
                                                  null ||
                                              functions.convertDatetimeToString(
                                                      FFAppState().startTime) ==
                                                  '',
                                          true,
                                        ) &&
                                        (functions.convertDatetimeToString(
                                                    FFAppState().endTime) ==
                                                null ||
                                            functions.convertDatetimeToString(
                                                    FFAppState().endTime) ==
                                                '')) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('入力エラー'),
                                            content: Text('時間を入力してください'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (FFAppState().startTime ==
                                        FFAppState().endTime) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('入力エラー'),
                                            content: Text('開始時間と終了時間が同じです'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (FFAppState().startTime! >
                                        FFAppState().endTime!) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('入力エラー'),
                                            content:
                                                Text('開始時間は終了時間よりも前にしてください'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_backend_call');

                                      await BookableRecord.collection
                                          .doc()
                                          .set({
                                        ...createBookableRecordData(
                                          sitterId: currentUserUid,
                                          date: FFAppState()
                                              .selectedDate
                                              ?.toString(),
                                          prefecture: FFAppState().selectedPref,
                                          startTime: _model.datePicked1,
                                          endTime: _model.datePicked2,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'cities': FFAppState().selectCities,
                                          },
                                        ),
                                      });
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '登録完了',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: '登録',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).success,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans JP',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 15.0, 0.0, 0.0),
                            child: Text(
                              '登録済み予約可能時間一覧',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: StreamBuilder<List<BookableRecord>>(
                            stream: queryBookableRecord(
                              queryBuilder: (bookableRecord) => bookableRecord
                                  .where(
                                    'sitter_id',
                                    isEqualTo: currentUserUid,
                                  )
                                  .where(
                                    'date',
                                    isEqualTo:
                                        FFAppState().selectedDate?.toString(),
                                  ),
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
                              List<BookableRecord> listViewBookableRecordList =
                                  snapshot.data!;
                              if (listViewBookableRecordList.isEmpty) {
                                return EmptyStateWidget(
                                  icon: Icon(
                                    Icons.face_retouching_off_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                  title: 'まだ登録がありません',
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewBookableRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 5.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewBookableRecord =
                                      listViewBookableRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              dateTimeFormat(
                                                "Hm",
                                                listViewBookableRecord
                                                    .startTime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans JP',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            '～',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              "Hm",
                                              listViewBookableRecord.endTime!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Container(
                                            width: 130.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listViewBookableRecord
                                                        .prefecture,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions.convertListToText(
                                                          listViewBookableRecord
                                                              .cities
                                                              .toList()),
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 30.0,
                                              fillColor: Color(0xFFAE1A22),
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 15.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'REGISTER_PAGE_delete_outline_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');
                                                await listViewBookableRecord
                                                    .reference
                                                    .delete();
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 3.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 3.0)),
                    ),
                  ],
                ),
              ),
              if (!valueOrDefault<bool>(currentUserDocument?.approval, false))
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.neverAuthOverlayModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NeverAuthOverlayWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

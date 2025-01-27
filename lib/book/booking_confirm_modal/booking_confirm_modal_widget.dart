import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/book/no_dog_error/no_dog_error_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_confirm_modal_model.dart';
export 'booking_confirm_modal_model.dart';

class BookingConfirmModalWidget extends StatefulWidget {
  const BookingConfirmModalWidget({
    super.key,
    required this.bookableRef,
  });

  final DocumentReference? bookableRef;

  @override
  State<BookingConfirmModalWidget> createState() =>
      _BookingConfirmModalWidgetState();
}

class _BookingConfirmModalWidgetState extends State<BookingConfirmModalWidget>
    with TickerProviderStateMixin {
  late BookingConfirmModalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingConfirmModalModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<BookableRecord>(
      stream: BookableRecord.getDocument(widget!.bookableRef!),
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

        final overlayBookableRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 670.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: Color(0x1E000000),
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOOKING_CONFIRM_MODAL_Icon_eqh93jhl_ON_T');
                              logFirebaseEvent('Icon_update_app_state');
                              FFAppState().showBookRequestModal = false;
                              FFAppState().update(() {});
                            },
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                '依頼時間',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
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
                                          'BOOKING_CONFIRM_MODAL_COMP_start_ON_TAP');
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                    minimumDate: DateTime(1900),
                                                    initialDateTime:
                                                        (FFAppState()
                                                                .selectedDate ??
                                                            DateTime.now()),
                                                    maximumDate: DateTime(2050),
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
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "Hm",
                                              _model.datePicked1,
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
                                          'BOOKING_CONFIRM_MODAL_COMP_end_ON_TAP');
                                      logFirebaseEvent('end_date_time_picker');
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                    minimumDate: DateTime(1900),
                                                    initialDateTime:
                                                        (FFAppState()
                                                                .selectedDate ??
                                                            DateTime.now()),
                                                    maximumDate: DateTime(2050),
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
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "Hm",
                                              _model.datePicked2,
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
                            Text(
                              'わんこを選択',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final dogs =
                                      (currentUserDocument?.dogs?.toList() ??
                                              [])
                                          .toList();
                                  if (dogs.isEmpty) {
                                    return NoDogErrorWidget();
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: dogs.length,
                                    itemBuilder: (context, dogsIndex) {
                                      final dogsItem = dogs[dogsIndex];
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValueMap[
                                                    dogsItem] ??= true,
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                          .checkboxValueMap[
                                                      dogsItem] = newValue!);
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Text(
                                              dogsItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Noto Sans JP',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Text(
                              'メッセージ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
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
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                                maxLines: 5,
                                maxLength: 150,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 12.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.05),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (_model.datePicked1 == null) {
                                    return true;
                                  } else if (_model.datePicked2 == null) {
                                    return true;
                                  } else if (_model
                                          .checkboxCheckedItems.length ==
                                      0) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }()
                                    ? null
                                    : () async {
                                        logFirebaseEvent(
                                            'BOOKING_CONFIRM_MODAL_COMP__BTN_ON_TAP');
                                        if (!((_model.datePicked1! >=
                                                overlayBookableRecord
                                                    .startTime!) &&
                                            (_model.datePicked2! <=
                                                overlayBookableRecord
                                                    .endTime!) &&
                                            (_model.datePicked1! <
                                                _model.datePicked2!))) {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await MatchRecord.collection
                                              .doc()
                                              .set({
                                            ...createMatchRecordData(
                                              status: MatchStatus.applying,
                                              user: currentUserReference,
                                              bookable: widget!.bookableRef,
                                              requestStartTime:
                                                  _model.datePicked1,
                                              requestEndTime:
                                                  _model.datePicked2,
                                              requestComment:
                                                  _model.textController.text,
                                              sitter: overlayBookableRecord
                                                  .sitterId,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'request_dogs':
                                                    _model.checkboxCheckedItems,
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().showBookRequestModal =
                                              false;
                                          _model.updatePage(() {});
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('bookListOwner');
                                        } else {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('入力時間エラー'),
                                                content:
                                                    Text('入力時間が正しいか確認してください'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                text: '送信',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 44.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  hoverColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  hoverTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  hoverElevation: 0.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        );
      },
    );
  }
}

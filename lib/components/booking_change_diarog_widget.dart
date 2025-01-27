import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_change_diarog_model.dart';
export 'booking_change_diarog_model.dart';

class BookingChangeDiarogWidget extends StatefulWidget {
  const BookingChangeDiarogWidget({
    super.key,
    required this.bookableRef,
    required this.matchRef,
  });

  final DocumentReference? bookableRef;
  final DocumentReference? matchRef;

  @override
  State<BookingChangeDiarogWidget> createState() =>
      _BookingChangeDiarogWidgetState();
}

class _BookingChangeDiarogWidgetState extends State<BookingChangeDiarogWidget> {
  late BookingChangeDiarogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingChangeDiarogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: StreamBuilder<BookableRecord>(
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

            final materialDialog2BookableRecord = snapshot.data!;

            return Container(
              width: double.infinity,
              height: 320.0,
              constraints: BoxConstraints(
                maxWidth: 530.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: StreamBuilder<MatchRecord>(
                  stream: MatchRecord.getDocument(widget!.matchRef!),
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

                    final columnMatchRecord = snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'BOOKING_CHANGE_DIAROG_Icon_cmxja426_ON_T');
                                    logFirebaseEvent('Icon_navigate_back');
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '確認',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Text(
                                    'ご登録いただいている予約可能時間を以下に変更します。\nよろしいですか？',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans JP',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '登録済：',
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
                                          materialDialog2BookableRecord
                                              .startTime!,
                                          locale: FFLocalizations.of(context)
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
                                          materialDialog2BookableRecord
                                              .endTime!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '変更後：',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans JP',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        functions.timeDifferenceAandB(
                                                    materialDialog2BookableRecord
                                                        .startTime,
                                                    columnMatchRecord
                                                        .requestStartTime)! <
                                                functions.timeDifferenceAandB(
                                                    columnMatchRecord
                                                        .requestEndTime,
                                                    materialDialog2BookableRecord
                                                        .endTime)!
                                            ? dateTimeFormat(
                                                "Hm",
                                                columnMatchRecord
                                                    .requestEndTime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : dateTimeFormat(
                                                "Hm",
                                                materialDialog2BookableRecord
                                                    .startTime!,
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
                                        '～',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans JP',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        functions.timeDifferenceAandB(
                                                    materialDialog2BookableRecord
                                                        .startTime,
                                                    columnMatchRecord
                                                        .requestStartTime)! <
                                                functions.timeDifferenceAandB(
                                                    columnMatchRecord
                                                        .requestEndTime,
                                                    materialDialog2BookableRecord
                                                        .endTime)!
                                            ? dateTimeFormat(
                                                "Hm",
                                                materialDialog2BookableRecord
                                                    .endTime!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : dateTimeFormat(
                                                "Hm",
                                                columnMatchRecord
                                                    .requestEndTime!,
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
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'BOOKING_CHANGE_DIAROG_COMP__BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');
                                      await materialDialog2BookableRecord
                                          .reference
                                          .delete();
                                      logFirebaseEvent('Button_backend_call');

                                      await columnMatchRecord.reference
                                          .update(createMatchRecordData(
                                        status: MatchStatus.applied,
                                        sitterRef: currentUserReference,
                                      ));
                                      logFirebaseEvent('Button_backend_call');

                                      await ChatsRecord.collection
                                          .doc()
                                          .set(createChatsRecordData(
                                            userA: columnMatchRecord.user,
                                            userB: currentUserReference,
                                            matchRef:
                                                columnMatchRecord.reference,
                                          ));
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('chatList');
                                    },
                                    text: 'いいえ、削除します',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Noto Sans JP',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'BOOKING_CHANGE_DIAROG_COMP__BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');

                                      await materialDialog2BookableRecord
                                          .reference
                                          .update(createBookableRecordData(
                                        startTime: functions.timeDifferenceAandB(
                                                    materialDialog2BookableRecord
                                                        .startTime,
                                                    columnMatchRecord
                                                        .requestStartTime)! <
                                                functions.timeDifferenceAandB(
                                                    columnMatchRecord
                                                        .requestEndTime,
                                                    materialDialog2BookableRecord
                                                        .endTime)!
                                            ? columnMatchRecord.requestEndTime
                                            : materialDialog2BookableRecord
                                                .startTime,
                                        endTime: functions.timeDifferenceAandB(
                                                    materialDialog2BookableRecord
                                                        .startTime,
                                                    columnMatchRecord
                                                        .requestStartTime)! <
                                                functions.timeDifferenceAandB(
                                                    columnMatchRecord
                                                        .requestEndTime,
                                                    materialDialog2BookableRecord
                                                        .endTime)!
                                            ? materialDialog2BookableRecord
                                                .endTime
                                            : columnMatchRecord
                                                .requestStartTime,
                                      ));
                                      logFirebaseEvent('Button_backend_call');

                                      await columnMatchRecord.reference
                                          .update(createMatchRecordData(
                                        status: MatchStatus.applied,
                                        sitterRef: currentUserReference,
                                      ));
                                      logFirebaseEvent('Button_backend_call');

                                      await ChatsRecord.collection
                                          .doc()
                                          .set(createChatsRecordData(
                                            userA: columnMatchRecord.user,
                                            userB: currentUserReference,
                                            matchRef:
                                                columnMatchRecord.reference,
                                          ));
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('bookListSitter');
                                    },
                                    text: 'はい、変更します',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Noto Sans JP',
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

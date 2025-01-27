import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat_page/chat_details_overlay/chat_details_overlay_widget.dart';
import '/chat_page/chat_thread_component/chat_thread_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_detail_model.dart';
export 'chat_detail_model.dart';

class ChatDetailWidget extends StatefulWidget {
  const ChatDetailWidget({
    super.key,
    required this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<ChatDetailWidget> createState() => _ChatDetailWidgetState();
}

class _ChatDetailWidgetState extends State<ChatDetailWidget> {
  late ChatDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatDetailModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'chatDetail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_DETAIL_chatDetail_ON_INIT_STATE');
      logFirebaseEvent('chatDetail_backend_call');
      unawaited(
        () async {
          await widget!.chatRef!.reference.update({
            ...mapToFirestore(
              {
                'last_message_seen_by':
                    FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }(),
      );
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
    return StreamBuilder<MatchRecord>(
      stream: MatchRecord.getDocument(widget!.chatRef!.matchRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final chatDetailMatchRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHAT_DETAIL_arrow_back_rounded_ICN_ON_TA');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.goNamed(
                    'chatList',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 230),
                      ),
                    },
                  );
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.chatThreadComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: ChatThreadComponentWidget(
                      chatRef: widget!.chatRef,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('CHAT_DETAIL_PAGE__BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await chatDetailMatchRecord.reference
                                  .update(createMatchRecordData(
                                status: MatchStatus.returned,
                                realEndTime: getCurrentTimestamp,
                              ));
                              logFirebaseEvent('Button_backend_call');

                              await chatDetailMatchRecord.reference
                                  .update(createMatchRecordData(
                                depositTime: functions
                                    .countMinute(
                                        chatDetailMatchRecord.realStartTime!,
                                        chatDetailMatchRecord.realEndTime!)
                                    .toString(),
                              ));
                              if (chatDetailMatchRecord.depositTime != null &&
                                  chatDetailMatchRecord.depositTime != '') {
                                logFirebaseEvent('Button_backend_call');

                                await chatDetailMatchRecord.reference
                                    .update(createMatchRecordData(
                                  totalPayment: functions.calculateTotalPayment(
                                      functions.multiplication(
                                          chatDetailMatchRecord.depositTime,
                                          '50')),
                                  paymentForSitter: functions.multiplication(
                                      chatDetailMatchRecord.depositTime, '40'),
                                ));
                                if (chatDetailMatchRecord.totalPayment !=
                                    null) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('返却完了'),
                                                content: Text('支払いに進んでください'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('後で(3日以内)'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('支払いに進む'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'PaymentPage',
                                      queryParameters: {
                                        'matchRef': serializeParam(
                                          chatDetailMatchRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('ownerHistory');
                                  }
                                }
                              }
                            },
                            text: 'テスト返却読み取り',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('CHAT_DETAIL_PAGE__BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await chatDetailMatchRecord.reference
                                  .update(createMatchRecordData(
                                status: MatchStatus.keeping,
                                realStartTime: getCurrentTimestamp,
                              ));
                            },
                            text: 'テスト預かり読み取り',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (() {
                            if ((chatDetailMatchRecord.user ==
                                    currentUserReference) &&
                                (chatDetailMatchRecord.status ==
                                    MatchStatus.applied)) {
                              return true;
                            } else if ((chatDetailMatchRecord.sitterRef ==
                                    currentUserReference) &&
                                (chatDetailMatchRecord.status ==
                                    MatchStatus.keeping)) {
                              return true;
                            } else {
                              return false;
                            }
                          }())
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHAT_DETAIL_PAGE_QR_BTN_ON_TAP');
                                logFirebaseEvent('Button_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  barrierColor: Color(0x00FFFFFF),
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ChatDetailsOverlayWidget(
                                          chatRef: widget!.chatRef!.reference,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              text: 'QR表示',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                          if (() {
                            if ((chatDetailMatchRecord.user ==
                                    currentUserReference) &&
                                (chatDetailMatchRecord.status ==
                                    MatchStatus.keeping)) {
                              return true;
                            } else if ((chatDetailMatchRecord.sitterRef ==
                                    currentUserReference) &&
                                (chatDetailMatchRecord.status ==
                                    MatchStatus.applied)) {
                              return true;
                            } else {
                              return false;
                            }
                          }())
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHAT_DETAIL_PAGE_QR_BTN_ON_TAP');
                                logFirebaseEvent(
                                    'Button_scan_barcode_q_r_code');
                                _model.qr =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  'Cancel', // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.QR,
                                );

                                if (chatDetailMatchRecord.status ==
                                    MatchStatus.applied) {
                                  if (_model.qr ==
                                      chatDetailMatchRecord.reference.id) {
                                    logFirebaseEvent('Button_backend_call');

                                    await chatDetailMatchRecord.reference
                                        .update(createMatchRecordData(
                                      status: MatchStatus.keeping,
                                      realStartTime: getCurrentTimestamp,
                                    ));
                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('エラー'),
                                          content: Text('コードが違います'),
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
                                  }
                                } else if (chatDetailMatchRecord.status ==
                                    MatchStatus.keeping) {
                                  if (_model.qr ==
                                      chatDetailMatchRecord.reference.id) {
                                    logFirebaseEvent('Button_backend_call');

                                    await chatDetailMatchRecord.reference
                                        .update(createMatchRecordData(
                                      status: MatchStatus.returned,
                                      realEndTime: getCurrentTimestamp,
                                    ));
                                    logFirebaseEvent('Button_backend_call');

                                    await chatDetailMatchRecord.reference
                                        .update(createMatchRecordData(
                                      depositTime: functions
                                          .countMinute(
                                              chatDetailMatchRecord
                                                  .realStartTime!,
                                              chatDetailMatchRecord
                                                  .realEndTime!)
                                          .toString(),
                                    ));
                                    if (chatDetailMatchRecord.depositTime !=
                                            null &&
                                        chatDetailMatchRecord.depositTime !=
                                            '') {
                                      logFirebaseEvent('Button_backend_call');

                                      await chatDetailMatchRecord.reference
                                          .update(createMatchRecordData(
                                        totalPayment:
                                            functions.calculateTotalPayment(
                                                functions.multiplication(
                                                    chatDetailMatchRecord
                                                        .depositTime,
                                                    '50')),
                                        paymentForSitter:
                                            functions.multiplication(
                                                chatDetailMatchRecord
                                                    .depositTime,
                                                '40'),
                                      ));
                                      if (chatDetailMatchRecord.totalPayment !=
                                          null) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('返却完了'),
                                                      content:
                                                          Text('支払いに進んでください'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child:
                                                              Text('後で(3日以内)'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('支払いに進む'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'PaymentPage',
                                            queryParameters: {
                                              'matchRef': serializeParam(
                                                chatDetailMatchRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('ownerHistory');
                                        }
                                      }
                                    }
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('エラー'),
                                          content: Text('コードが違います'),
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
                                  }
                                }

                                safeSetState(() {});
                              },
                              text: 'QR読み取り',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

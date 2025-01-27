import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/booking_change_diarog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'apply_detail_model.dart';
export 'apply_detail_model.dart';

class ApplyDetailWidget extends StatefulWidget {
  const ApplyDetailWidget({
    super.key,
    required this.matchRef,
  });

  final DocumentReference? matchRef;

  @override
  State<ApplyDetailWidget> createState() => _ApplyDetailWidgetState();
}

class _ApplyDetailWidgetState extends State<ApplyDetailWidget> {
  late ApplyDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplyDetailModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'applyDetail'});
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
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 24.0,
                              borderWidth: 1.0,
                              buttonSize: 44.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'APPLY_DETAIL_keyboard_arrow_left_ICN_ON_');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: StreamBuilder<BookableRecord>(
                          stream: BookableRecord.getDocument(
                              columnMatchRecord.bookable!),
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

                            final containerBookableRecord = snapshot.data!;

                            return Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 1.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        functions.displayDate(
                                            containerBookableRecord.date),
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto Sans JP',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          child: Text(
                                            containerBookableRecord.prefecture,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Noto Sans JP',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.convertListToText(
                                                containerBookableRecord.cities
                                                    .toList()),
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
                                    Text(
                                      '${dateTimeFormat(
                                        "Hm",
                                        containerBookableRecord.startTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}～${dateTimeFormat(
                                        "Hm",
                                        containerBookableRecord.endTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
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
                            );
                          },
                        ),
                      ),
                      Text(
                        '上の枠に以下の依頼が来ました',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto Sans JP',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'uid',
                                isEqualTo: columnMatchRecord.user?.id,
                              ),
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
                              List<UsersRecord> columnUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnUsersRecord =
                                  columnUsersRecordList.isNotEmpty
                                      ? columnUsersRecordList.first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'APPLY_DETAIL_PAGE_Column_tlo54njw_ON_TAP');
                                            logFirebaseEvent(
                                                'Column_navigate_to');

                                            context.pushNamed(
                                              'ownerDetail',
                                              queryParameters: {
                                                'ounerRef': serializeParam(
                                                  columnMatchRecord.user,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 80.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  columnUsersRecord!.photoUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  columnUsersRecord?.name,
                                                  '-',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '依頼時間：',
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
                                                    '${dateTimeFormat(
                                                      "Hm",
                                                      columnMatchRecord
                                                          .requestStartTime,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}～${dateTimeFormat(
                                                      "Hm",
                                                      columnMatchRecord
                                                          .requestEndTime,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    )}',
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
                                              Text(
                                                columnMatchRecord
                                                    .requestComment,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'わんこ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans JP',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        StreamBuilder<List<DogsRecord>>(
                                          stream: queryDogsRecord(
                                            queryBuilder: (dogsRecord) =>
                                                dogsRecord
                                                    .where(
                                                      'user_id',
                                                      isEqualTo:
                                                          columnUsersRecord
                                                              ?.uid,
                                                    )
                                                    .whereIn(
                                                        'dog_name',
                                                        columnMatchRecord
                                                            .requestDogs),
                                          ),
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<DogsRecord> rowDogsRecordList =
                                                snapshot.data!;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  rowDogsRecordList.length,
                                                  (rowIndex) {
                                                final rowDogsRecord =
                                                    rowDogsRecordList[rowIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 5.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'APPLY_DETAIL_Container_ojcshlgl_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'OwnerDogDetail',
                                                        queryParameters: {
                                                          'dogRef':
                                                              serializeParam(
                                                            rowDogsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 150.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFD4A1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 60.0,
                                                              height: 60.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                rowDogsRecord
                                                                    .photo,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  rowDogsRecord
                                                                      .dogName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  '${functions.calculateAge(rowDogsRecord.birthday)}さい',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  rowDogsRecord
                                                                      .kind,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans JP',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: StreamBuilder<BookableRecord>(
                            stream: BookableRecord.getDocument(
                                columnMatchRecord.bookable!),
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

                              final buttonBookableRecord = snapshot.data!;

                              return FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'APPLY_DETAIL_PAGE__BTN_ON_TAP');
                                  if ((buttonBookableRecord.startTime ==
                                          columnMatchRecord.requestStartTime) &&
                                      (buttonBookableRecord.endTime ==
                                          columnMatchRecord.requestEndTime)) {
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
                                          matchRef: columnMatchRecord.reference,
                                        ));
                                    logFirebaseEvent('Button_backend_call');
                                    await buttonBookableRecord.reference
                                        .delete();
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed('bookListSitter');
                                  } else {
                                    logFirebaseEvent('Button_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: BookingChangeDiarogWidget(
                                              bookableRef: buttonBookableRecord
                                                  .reference,
                                              matchRef: widget!.matchRef!,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                text: '承認',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        color: Colors.white,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('APPLY_DETAIL_PAGE__BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await columnMatchRecord.reference
                                .update(createMatchRecordData(
                              status: MatchStatus.rejected,
                            ));
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed('bookListSitter');
                          },
                          text: '却下',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Noto Sans JP',
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

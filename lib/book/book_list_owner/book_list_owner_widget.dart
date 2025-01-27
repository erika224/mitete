import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/component/empty_state/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_list_owner_model.dart';
export 'book_list_owner_model.dart';

class BookListOwnerWidget extends StatefulWidget {
  const BookListOwnerWidget({super.key});

  @override
  State<BookListOwnerWidget> createState() => _BookListOwnerWidgetState();
}

class _BookListOwnerWidgetState extends State<BookListOwnerWidget> {
  late BookListOwnerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookListOwnerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'bookListOwner'});
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
          child: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            '依頼予約　承認待ち一覧',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto Sans JP',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: StreamBuilder<List<MatchRecord>>(
                              stream: queryMatchRecord(
                                queryBuilder: (matchRecord) => matchRecord
                                    .where(
                                      'user',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'status',
                                      isEqualTo:
                                          MatchStatus.applying.serialize(),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<MatchRecord> listViewMatchRecordList =
                                    snapshot.data!;
                                if (listViewMatchRecordList.isEmpty) {
                                  return EmptyStateWidget(
                                    icon: Icon(
                                      Icons.error_outlined,
                                      size: 60.0,
                                    ),
                                    title: '承認待ちの予約がありません',
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewMatchRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 5.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMatchRecord =
                                        listViewMatchRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'BOOK_LIST_OWNER_Container_qtnl3s81_ON_TA');
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            'BookableDetail',
                                            queryParameters: {
                                              'bookableRef': serializeParam(
                                                listViewMatchRecord.bookable,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: listViewMatchRecord.status ==
                                                    MatchStatus.applying
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: listViewMatchRecord
                                                                  .status ==
                                                              MatchStatus
                                                                  .applying
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '承認待ち',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans JP',
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    functions.displayDate(
                                                        listViewMatchRecord
                                                            .requestStartTime
                                                            ?.toString()),
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 2.0, 0.0),
                                                child: Text(
                                                  '${dateTimeFormat(
                                                    "Hm",
                                                    listViewMatchRecord
                                                        .requestStartTime,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}～${dateTimeFormat(
                                                    "Hm",
                                                    listViewMatchRecord
                                                        .requestEndTime,
                                                    locale: FFLocalizations.of(
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
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.navigate_next,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          '承認済み\nチャットページからシッターさんと連絡が取れます',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto Sans JP',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<MatchRecord>>(
                                stream: queryMatchRecord(
                                  queryBuilder: (matchRecord) => matchRecord
                                      .where(
                                        'user',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'status',
                                        isEqualTo:
                                            MatchStatus.applied.serialize(),
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<MatchRecord> listViewMatchRecordList =
                                      snapshot.data!;
                                  if (listViewMatchRecordList.isEmpty) {
                                    return Center(
                                      child: EmptyStateWidget(
                                        icon: Icon(
                                          Icons.error_outlined,
                                          size: 60.0,
                                        ),
                                        title: '依頼中のシッターがいません',
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewMatchRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 5.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewMatchRecord =
                                          listViewMatchRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        '承認済み',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Noto Sans JP',
                                                              color:
                                                                  Colors.white,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    functions.displayDate(
                                                        listViewMatchRecord
                                                            .requestStartTime
                                                            ?.toString()),
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
                                              ),
                                              Text(
                                                '${dateTimeFormat(
                                                  "Hm",
                                                  listViewMatchRecord
                                                      .requestStartTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}～${dateTimeFormat(
                                                  "Hm",
                                                  listViewMatchRecord
                                                      .requestEndTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans JP',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

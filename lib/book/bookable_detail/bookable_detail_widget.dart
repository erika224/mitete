import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/book/booking_confirm_modal/booking_confirm_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookable_detail_model.dart';
export 'bookable_detail_model.dart';

class BookableDetailWidget extends StatefulWidget {
  const BookableDetailWidget({
    super.key,
    required this.bookableRef,
  });

  final DocumentReference? bookableRef;

  @override
  State<BookableDetailWidget> createState() => _BookableDetailWidgetState();
}

class _BookableDetailWidgetState extends State<BookableDetailWidget> {
  late BookableDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookableDetailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BookableDetail'});
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

    return StreamBuilder<BookableRecord>(
      stream: BookableRecord.getDocument(widget!.bookableRef!),
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

        final bookableDetailBookableRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('BOOKABLE_DETAIL_Icon_zs4nj9ig_ON_TAP');
                logFirebaseEvent('Icon_navigate_back');
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 400.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'uid',
                                isEqualTo:
                                    bookableDetailBookableRecord.sitterId,
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
                              List<UsersRecord> imageUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final imageUsersRecord =
                                  imageUsersRecordList.isNotEmpty
                                      ? imageUsersRecordList.first
                                      : null;

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  imageUsersRecord!.photoUrl,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 230.0,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: bookableDetailBookableRecord.sitterId,
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
                          List<UsersRecord> paddingColumnUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final paddingColumnUsersRecord =
                              paddingColumnUsersRecordList.isNotEmpty
                                  ? paddingColumnUsersRecordList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  paddingColumnUsersRecord?.name,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  paddingColumnUsersRecord?.description,
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Noto Sans JP',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Divider(
                                height: 32.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 300.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  '${dateTimeFormat(
                                    "Hm",
                                    bookableDetailBookableRecord.startTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}～${dateTimeFormat(
                                    "Hm",
                                    bookableDetailBookableRecord.endTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans JP',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'BOOKABLE_DETAIL_ButtonPrimary_ON_TAP');
                            logFirebaseEvent('ButtonPrimary_update_app_state');
                            FFAppState().showBookRequestModal = true;
                            safeSetState(() {});
                          },
                          text: '依頼する',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Noto Sans JP',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (FFAppState().showBookRequestModal)
                StreamBuilder<List<DogsRecord>>(
                  stream: queryDogsRecord(
                    queryBuilder: (dogsRecord) => dogsRecord.where(
                      'user_id',
                      isEqualTo: currentUserUid,
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
                    List<DogsRecord> bookingConfirmModalDogsRecordList =
                        snapshot.data!;

                    return wrapWithModel(
                      model: _model.bookingConfirmModalModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BookingConfirmModalWidget(
                        bookableRef: widget!.bookableRef!,
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

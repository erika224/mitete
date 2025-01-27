import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'owner_detail_model.dart';
export 'owner_detail_model.dart';

class OwnerDetailWidget extends StatefulWidget {
  const OwnerDetailWidget({
    super.key,
    required this.ounerRef,
  });

  final DocumentReference? ounerRef;

  @override
  State<OwnerDetailWidget> createState() => _OwnerDetailWidgetState();
}

class _OwnerDetailWidgetState extends State<OwnerDetailWidget> {
  late OwnerDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OwnerDetailModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ownerDetail'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 500.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(widget!.ounerRef!),
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

                        final columnUsersRecord = snapshot.data!;

                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'OWNER_DETAIL_keyboard_arrow_left_ICN_ON_');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 400.0,
                                      height: 400.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            columnUsersRecord.photoUrl,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 230.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    columnUsersRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Noto Sans JP',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  if (columnUsersRecord.shopurl != null &&
                                      columnUsersRecord.shopurl != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        columnUsersRecord.shopurl,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Noto Sans JP',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  Text(
                                    columnUsersRecord.description,
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Noto Sans JP',
                                          letterSpacing: 0.0,
                                        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

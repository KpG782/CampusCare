import '/backend/backend.dart';
import '/components/resources1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mental_resource_list_step1_model.dart';
export 'mental_resource_list_step1_model.dart';

class MentalResourceListStep1Widget extends StatefulWidget {
  const MentalResourceListStep1Widget({super.key});

  static String routeName = 'MentalResource_listStep1';
  static String routePath = '/mentalResourceListStep1';

  @override
  State<MentalResourceListStep1Widget> createState() =>
      _MentalResourceListStep1WidgetState();
}

class _MentalResourceListStep1WidgetState
    extends State<MentalResourceListStep1Widget> {
  late MentalResourceListStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MentalResourceListStep1Model());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.goNamed(SelfHelpPageWidget.routeName);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: Text(
                            'Mental Resources',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 15.0))
                          .around(SizedBox(width: 15.0)),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            constraints: BoxConstraints(
                              minHeight: 500.0,
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 40.0,
                            ),
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<MentalResourcesRecord>>(
                              stream: queryMentalResourcesRecord(
                                queryBuilder: (mentalResourcesRecord) =>
                                    mentalResourcesRecord.orderBy('mental_ID'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitChasingDots(
                                        color: Color(0xFF19C5C5),
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<MentalResourcesRecord>
                                    listViewMentalResourcesRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMentalResourcesRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMentalResourcesRecord =
                                        listViewMentalResourcesRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Resources1Widget(
                                        key: Key(
                                            'Keysyh_${listViewIndex}_of_${listViewMentalResourcesRecordList.length}'),
                                        parameter1:
                                            listViewMentalResourcesRecord
                                                .mentalImage,
                                        parameter2:
                                            listViewMentalResourcesRecord
                                                .mentalTitle,
                                        parameter4:
                                            listViewMentalResourcesRecord
                                                .reference,
                                        parameter5:
                                            listViewMentalResourcesRecord
                                                .mentalDescription,
                                        parameter6:
                                            listViewMentalResourcesRecord
                                                .mentalFavorite,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

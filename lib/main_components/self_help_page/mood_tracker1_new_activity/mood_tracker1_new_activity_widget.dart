import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mood_tracker1_new_activity_model.dart';
export 'mood_tracker1_new_activity_model.dart';

class MoodTracker1NewActivityWidget extends StatefulWidget {
  const MoodTracker1NewActivityWidget({
    super.key,
    this.date,
  });

  final DateTime? date;

  static String routeName = 'mood_tracker1NewActivity';
  static String routePath = '/moodTracker1NewActivity';

  @override
  State<MoodTracker1NewActivityWidget> createState() =>
      _MoodTracker1NewActivityWidgetState();
}

class _MoodTracker1NewActivityWidgetState
    extends State<MoodTracker1NewActivityWidget> {
  late MoodTracker1NewActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodTracker1NewActivityModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().moodHappy = false;
      FFAppState().moodAngry = false;
      FFAppState().moodAnnoyed = false;
      FFAppState().moodAnxious = false;
      FFAppState().moodBored = false;
      FFAppState().moodExcited = false;
      FFAppState().moodLove = false;
      FFAppState().moodPleasant = false;
      FFAppState().moodSad = false;
      FFAppState().moodSilly = false;
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

    return StreamBuilder<List<MoodChoicesRecord>>(
      stream: queryMoodChoicesRecord(
        queryBuilder: (moodChoicesRecord) =>
            moodChoicesRecord.orderBy('mood_id'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: Color(0xFF19C5C5),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<MoodChoicesRecord> moodTracker1NewActivityMoodChoicesRecordList =
            snapshot.data!;

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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                            context.safePop();
                          },
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 15.0))
                        .around(SizedBox(width: 15.0)),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                70.0, 0.0, 70.0, 0.0),
                            child: Text(
                              'Choose your Emotion',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 15.0))
                          .around(SizedBox(width: 15.0)),
                    ),
                  ),
                  Container(
                    width: 380.0,
                    height: 500.0,
                    child: Stack(
                      children: [
                        if (FFAppState().moodHappy == false)
                          Align(
                            alignment: AlignmentDirectional(-0.19, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = true;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(0)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(0)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Happy1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Text(
                            'Happy',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        if (FFAppState().moodHappy == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  125.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Happy.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodExcited == false)
                          Align(
                            alignment: AlignmentDirectional(-0.19, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  105.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = true;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(1)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(1)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Excited1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodExcited == true)
                          Align(
                            alignment: AlignmentDirectional(-0.19, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  105.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Excited.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                110.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Excited',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodAnxious == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  65.0, 50.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = true;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(9)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(9)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Anxious1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 55.0, 150.0, 0.0),
                            child: Text(
                              'Anxious',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodAnxious == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  65.0, 50.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Anxious.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodLove == false)
                          Align(
                            alignment: AlignmentDirectional(-0.19, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  205.0, 50.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = true;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(2)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(2)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/InLove1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                210.0, 55.0, 0.0, 0.0),
                            child: Text(
                              'In Love',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodLove == true)
                          Align(
                            alignment: AlignmentDirectional(-0.19, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  205.0, 50.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/InLove.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodSad == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = true;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(8)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(8)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Sad1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                255.0, 135.0, 0.0, 0.0),
                            child: Text(
                              'Silly',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodSilly == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  275.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = true;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(3)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(3)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Silly1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodSad == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Sad.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 135.0, 205.0, 0.0),
                            child: Text(
                              'Sad',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodSilly == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  275.0, 120.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Silly.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodAngry == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  63.0, 190.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = true;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(7)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(7)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Angry1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodAngry == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  63.0, 190.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Angry.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 215.0, 150.0, 0.0),
                            child: Text(
                              'Angry',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodPleasant == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  245.0, 190.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = true;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(4)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(4)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Pleasant1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodPleasant == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  245.0, 190.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Pleasant.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                200.0, 215.0, 0.0, 0.0),
                            child: Text(
                              'Pleasant',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodAnnoyed == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  120.0, 240.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = true;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(6)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(6)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Annoyed1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodAnnoyed == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  120.0, 240.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Annoyed.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 270.0, 10.0, 0.0),
                            child: Text(
                              'Annoyed',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                        if (FFAppState().moodBored == false)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  187.0, 240.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = true;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Mood Selected!'),
                                                  content: Text(
                                                      'Are you done selecting your Emotion?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    FFAppState().moodClicked =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(5)!
                                            .fileUrl;
                                    FFAppState().moodName =
                                        moodTracker1NewActivityMoodChoicesRecordList
                                            .elementAtOrNull(5)!
                                            .mood;
                                    safeSetState(() {});

                                    context.pushNamed(
                                      MoodTracker2NewActivityWidget.routeName,
                                      queryParameters: {
                                        'date': serializeParam(
                                          FFAppState().selectedDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/bored1.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().moodBored == true)
                          Align(
                            alignment: AlignmentDirectional(-0.99, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  187.0, 240.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().moodHappy = false;
                                  FFAppState().moodAngry = false;
                                  FFAppState().moodAnnoyed = false;
                                  FFAppState().moodAnxious = false;
                                  FFAppState().moodBored = false;
                                  FFAppState().moodExcited = false;
                                  FFAppState().moodLove = false;
                                  FFAppState().moodPleasant = false;
                                  FFAppState().moodSad = false;
                                  FFAppState().moodSilly = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Bored.png',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(-0.2, -0.77),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                115.0, 270.0, 10.0, 0.0),
                            child: Text(
                              'Bored',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
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
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'mood_tracker_model.dart';
export 'mood_tracker_model.dart';

class MoodTrackerWidget extends StatefulWidget {
  const MoodTrackerWidget({
    super.key,
    this.date,
  });

  final DateTime? date;

  static String routeName = 'mood_tracker';
  static String routePath = '/moodTracker';

  @override
  State<MoodTrackerWidget> createState() => _MoodTrackerWidgetState();
}

class _MoodTrackerWidgetState extends State<MoodTrackerWidget>
    with TickerProviderStateMixin {
  late MoodTrackerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodTrackerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().emojiSad = false;
      FFAppState().emojiAngry = false;
      FFAppState().emojiDisappointed = false;
      FFAppState().emojiHappy = false;
      FFAppState().emojiEcstatic = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'circleImageOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
          ),
        ],
      ),
      'circleImageOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.5, 1.5),
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<EmojiRecord>>(
      stream: queryEmojiRecord(
        queryBuilder: (emojiRecord) => emojiRecord.orderBy('emoji_ID'),
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
        List<EmojiRecord> moodTrackerEmojiRecordList = snapshot.data!;

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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'How was your day?',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 15.0))
                        .around(SizedBox(width: 15.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 30.0, 0.0, 0.0),
                          child: Text(
                            'How are you feeling today?',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            35.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                if (FFAppState().emojiAngry == true)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().emojiClicked = '';
                                      FFAppState().emojiAngry = false;
                                      safeSetState(() {});
                                      FFAppState().emojiName = '';
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        moodTrackerEmojiRecordList
                                            .elementAtOrNull(0)!
                                            .fileUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'circleImageOnActionTriggerAnimation1']!,
                                  ),
                                if (FFAppState().emojiAngry == false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().emojiClicked =
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(0)!
                                              .fileUrl;
                                      FFAppState().emojiAngry = true;
                                      FFAppState().emojiSad = false;
                                      FFAppState().emojiDisappointed = false;
                                      FFAppState().emojiHappy = false;
                                      FFAppState().emojiEcstatic = false;
                                      safeSetState(() {});
                                      FFAppState().emojiName =
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(0)!
                                              .emoji;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/Emoji_(3).png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'circleImageOnActionTriggerAnimation2']!,
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Angry',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                if (FFAppState().emojiSad == true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked = '';
                                        FFAppState().emojiName = '';
                                        FFAppState().emojiSad = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(1)!
                                              .fileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation3']!,
                                    ),
                                  ),
                                if (FFAppState().emojiSad == false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked =
                                            moodTrackerEmojiRecordList
                                                .elementAtOrNull(1)!
                                                .fileUrl;
                                        FFAppState().emojiName =
                                            moodTrackerEmojiRecordList
                                                .elementAtOrNull(1)!
                                                .emoji;
                                        safeSetState(() {});
                                        FFAppState().emojiSad = true;
                                        FFAppState().emojiAngry = false;
                                        FFAppState().emojiDisappointed = false;
                                        FFAppState().emojiHappy = false;
                                        FFAppState().emojiEcstatic = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Emoji_(4).png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation4']!,
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Sad',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                if (FFAppState().emojiDisappointed == true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked = '';
                                        FFAppState().emojiName = '';
                                        FFAppState().emojiDisappointed = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(2)!
                                              .fileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation5']!,
                                    ),
                                  ),
                                if (FFAppState().emojiDisappointed == false)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          19.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().emojiClicked =
                                              moodTrackerEmojiRecordList
                                                  .elementAtOrNull(2)!
                                                  .fileUrl;
                                          FFAppState().emojiName =
                                              moodTrackerEmojiRecordList
                                                  .elementAtOrNull(2)!
                                                  .emoji;
                                          safeSetState(() {});
                                          FFAppState().emojiSad = false;
                                          FFAppState().emojiAngry = false;
                                          FFAppState().emojiDisappointed = true;
                                          FFAppState().emojiHappy = false;
                                          FFAppState().emojiEcstatic = false;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Emoji_(5).png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'circleImageOnActionTriggerAnimation6']!,
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Disappointed',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                if (FFAppState().emojiHappy == true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked = '';
                                        FFAppState().emojiName = '';
                                        FFAppState().emojiHappy = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(3)!
                                              .fileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation7']!,
                                    ),
                                  ),
                                if (FFAppState().emojiHappy == false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().emojiClicked =
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(3)!
                                              .fileUrl;
                                      FFAppState().emojiName =
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(3)!
                                              .emoji;
                                      safeSetState(() {});
                                      FFAppState().emojiSad = false;
                                      FFAppState().emojiAngry = false;
                                      FFAppState().emojiDisappointed = false;
                                      FFAppState().emojiHappy = true;
                                      FFAppState().emojiEcstatic = false;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 45.0,
                                      height: 45.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/Emoji_(6).png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'circleImageOnActionTriggerAnimation8']!,
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Happy',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                if (FFAppState().emojiEcstatic == true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked = '';
                                        FFAppState().emojiName = '';
                                        FFAppState().emojiEcstatic = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          moodTrackerEmojiRecordList
                                              .elementAtOrNull(4)!
                                              .fileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation9']!,
                                    ),
                                  ),
                                if (FFAppState().emojiEcstatic == false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().emojiClicked =
                                            moodTrackerEmojiRecordList
                                                .elementAtOrNull(4)!
                                                .fileUrl;
                                        FFAppState().emojiName =
                                            moodTrackerEmojiRecordList
                                                .elementAtOrNull(4)!
                                                .emoji;
                                        safeSetState(() {});
                                        FFAppState().emojiSad = false;
                                        FFAppState().emojiAngry = false;
                                        FFAppState().emojiDisappointed = false;
                                        FFAppState().emojiHappy = false;
                                        FFAppState().emojiEcstatic = true;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Emoji_(7).png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'circleImageOnActionTriggerAnimation10']!,
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      'Delighted',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              40.0, 30.0, 0.0, 0.0),
                          child: Text(
                            'Write about your day',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          width: 320.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Container(
                            width: 200.0,
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
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'How\'s your day?',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
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
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              maxLines: 600,
                              maxLength: 100,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0C5F5F),
                              Color(0xFF0F7676),
                              Color(0xFF128E8E),
                              Color(0xFF16A9A9),
                              Color(0xFF19C5C5)
                            ],
                            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                            begin: AlignmentDirectional(-1.0, 0.0),
                            end: AlignmentDirectional(1.0, 0),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            FFAppState().logCount = FFAppState().logCount + 1;
                            safeSetState(() {});

                            await MoodLogRecord.collection
                                .doc()
                                .set(createMoodLogRecordData(
                                  logs: _model.textController.text,
                                  date: widget.date,
                                  emojis: FFAppState().emojiClicked,
                                  emojiName: FFAppState().emojiName,
                                  userId: currentUserUid,
                                  moodID: FFAppState().logCount,
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Mood Saved',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            safeSetState(() {
                              _model.textController?.clear();
                            });
                            FFAppState().emojiSad = false;
                            FFAppState().emojiAngry = false;
                            FFAppState().emojiDisappointed = false;
                            FFAppState().emojiHappy = false;
                            FFAppState().emojiEcstatic = false;
                            safeSetState(() {});

                            context.goNamed(MoodLogsCopyWidget.routeName);
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                70.0, 0.0, 70.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x004444BB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
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

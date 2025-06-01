import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_act_stats_model.dart';
export 'mood_act_stats_model.dart';

class MoodActStatsWidget extends StatefulWidget {
  const MoodActStatsWidget({
    super.key,
    required this.actImage,
    required this.actCount,
    required this.moodLog,
    required this.actDocs,
    required this.actLogs,
    required this.actName,
    required this.actIndex,
    required this.actCountList,
  });

  final String? actImage;
  final int? actCount;
  final DocumentReference? moodLog;
  final DocumentReference? actDocs;
  final List<String>? actLogs;
  final String? actName;
  final int? actIndex;
  final List<int>? actCountList;

  @override
  State<MoodActStatsWidget> createState() => _MoodActStatsWidgetState();
}

class _MoodActStatsWidgetState extends State<MoodActStatsWidget> {
  late MoodActStatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodActStatsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.actLogs = widget.actLogs!.toList().cast<String>();
      safeSetState(() {});
      for (int loop1Index = 0;
          loop1Index < widget.actLogs!.map((e) => e).toList().length;
          loop1Index++) {
        final currentLoop1Item =
            widget.actLogs!.map((e) => e).toList()[loop1Index];
        FFAppState().familyCount =
            widget.actLogs!.where((e) => e == 'family').toList().length;
        safeSetState(() {});
        FFAppState().friendsCount =
            widget.actLogs!.where((e) => e == 'friends').toList().length;
        safeSetState(() {});
        break;
      }
      for (int loop2Index = 0;
          loop2Index < widget.actCountList!.map((e) => e).toList().length;
          loop2Index++) {
        final currentLoop2Item =
            widget.actCountList!.map((e) => e).toList()[loop2Index];
        FFAppState().insertAtIndexInActCountList(0, FFAppState().familyCount);
        safeSetState(() {});
        FFAppState().insertAtIndexInActCountList(1, FFAppState().friendsCount);
        safeSetState(() {});
        break;
      }
      for (int loop3Index = 0;
          loop3Index < widget.actCountList!.map((e) => e).toList().length;
          loop3Index++) {
        final currentLoop3Item =
            widget.actCountList!.map((e) => e).toList()[loop3Index];

        await widget.actDocs!.update(createActivityImagesRecordData(
          act: '',
          image: '',
          id: '',
          actCount: currentLoop3Item,
        ));
      }
    });

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

    return badges.Badge(
      badgeContent: Text(
        widget.actCount!.toString(),
        style: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.interTight(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: Colors.white,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
      ),
      showBadge: true,
      shape: badges.BadgeShape.circle,
      badgeColor: Color(0xFF19C5C5),
      elevation: 4.0,
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      position: badges.BadgePosition.topEnd(),
      animationType: badges.BadgeAnimationType.scale,
      toAnimate: true,
      child: Container(
        width: 60.0,
        height: 60.0,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          widget.actImage!,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

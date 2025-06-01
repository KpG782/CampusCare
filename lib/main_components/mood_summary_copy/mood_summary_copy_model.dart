import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_components/self_help_page/mood_act_stats/mood_act_stats_widget.dart';
import 'mood_summary_copy_widget.dart' show MoodSummaryCopyWidget;
import 'package:flutter/material.dart';

class MoodSummaryCopyModel extends FlutterFlowModel<MoodSummaryCopyWidget> {
  ///  State fields for stateful widgets in this page.

  List<ActivityImagesRecord>? listViewPreviousSnapshot;
  // Models for moodAct_stats dynamic component.
  late FlutterFlowDynamicModels<MoodActStatsModel> moodActStatsModels;

  @override
  void initState(BuildContext context) {
    moodActStatsModels = FlutterFlowDynamicModels(() => MoodActStatsModel());
  }

  @override
  void dispose() {
    moodActStatsModels.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'mood_act_stats_widget.dart' show MoodActStatsWidget;
import 'package:flutter/material.dart';

class MoodActStatsModel extends FlutterFlowModel<MoodActStatsWidget> {
  ///  Local state fields for this component.

  int? actCount;

  List<String> actLogs = [];
  void addToActLogs(String item) => actLogs.add(item);
  void removeFromActLogs(String item) => actLogs.remove(item);
  void removeAtIndexFromActLogs(int index) => actLogs.removeAt(index);
  void insertAtIndexInActLogs(int index, String item) =>
      actLogs.insert(index, item);
  void updateActLogsAtIndex(int index, Function(String) updateFn) =>
      actLogs[index] = updateFn(actLogs[index]);

  List<int> actList = [];
  void addToActList(int item) => actList.add(item);
  void removeFromActList(int item) => actList.remove(item);
  void removeAtIndexFromActList(int index) => actList.removeAt(index);
  void insertAtIndexInActList(int index, int item) =>
      actList.insert(index, item);
  void updateActListAtIndex(int index, Function(int) updateFn) =>
      actList[index] = updateFn(actList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

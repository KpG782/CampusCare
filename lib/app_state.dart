import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isPlaying = prefs.getBool('ff_isPlaying') ?? _isPlaying;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _containerShown = true;
  bool get containerShown => _containerShown;
  set containerShown(bool value) {
    _containerShown = value;
  }

  int _selectedNo = 0;
  int get selectedNo => _selectedNo;
  set selectedNo(int value) {
    _selectedNo = value;
  }

  bool _favAcad = false;
  bool get favAcad => _favAcad;
  set favAcad(bool value) {
    _favAcad = value;
  }

  bool _favSuicide = false;
  bool get favSuicide => _favSuicide;
  set favSuicide(bool value) {
    _favSuicide = value;
  }

  bool _favAnxiety = false;
  bool get favAnxiety => _favAnxiety;
  set favAnxiety(bool value) {
    _favAnxiety = value;
  }

  bool _favFamily = false;
  bool get favFamily => _favFamily;
  set favFamily(bool value) {
    _favFamily = value;
  }

  bool _favDepression = false;
  bool get favDepression => _favDepression;
  set favDepression(bool value) {
    _favDepression = value;
  }

  bool _favEmotional = false;
  bool get favEmotional => _favEmotional;
  set favEmotional(bool value) {
    _favEmotional = value;
  }

  bool _favSubstance = false;
  bool get favSubstance => _favSubstance;
  set favSubstance(bool value) {
    _favSubstance = value;
  }

  bool _favGrief = false;
  bool get favGrief => _favGrief;
  set favGrief(bool value) {
    _favGrief = value;
  }

  bool _favHabit = false;
  bool get favHabit => _favHabit;
  set favHabit(bool value) {
    _favHabit = value;
  }

  bool _favTrauma = false;
  bool get favTrauma => _favTrauma;
  set favTrauma(bool value) {
    _favTrauma = value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  bool _newchat = true;
  bool get newchat => _newchat;
  set newchat(bool value) {
    _newchat = value;
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
  }

  void addToAvailability(AvailabilityStruct value) {
    availability.add(value);
  }

  void removeFromAvailability(AvailabilityStruct value) {
    availability.remove(value);
  }

  void removeAtIndexFromAvailability(int index) {
    availability.removeAt(index);
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    availability[index] = updateFn(_availability[index]);
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    availability.insert(index, value);
  }

  bool _notificationIsSeen = false;
  bool get notificationIsSeen => _notificationIsSeen;
  set notificationIsSeen(bool value) {
    _notificationIsSeen = value;
  }

  String _emojiClicked = '';
  String get emojiClicked => _emojiClicked;
  set emojiClicked(String value) {
    _emojiClicked = value;
  }

  String _emojiName = '';
  String get emojiName => _emojiName;
  set emojiName(String value) {
    _emojiName = value;
  }

  bool _sessionCancelled = false;
  bool get sessionCancelled => _sessionCancelled;
  set sessionCancelled(bool value) {
    _sessionCancelled = value;
  }

  bool _sessionReviewed = false;
  bool get sessionReviewed => _sessionReviewed;
  set sessionReviewed(bool value) {
    _sessionReviewed = value;
  }

  bool _lottiePlaying = false;
  bool get lottiePlaying => _lottiePlaying;
  set lottiePlaying(bool value) {
    _lottiePlaying = value;
  }

  bool _widgetVisibility = false;
  bool get widgetVisibility => _widgetVisibility;
  set widgetVisibility(bool value) {
    _widgetVisibility = value;
  }

  bool _peercontainerShown = true;
  bool get peercontainerShown => _peercontainerShown;
  set peercontainerShown(bool value) {
    _peercontainerShown = value;
  }

  bool _alreadyReserved = false;
  bool get alreadyReserved => _alreadyReserved;
  set alreadyReserved(bool value) {
    _alreadyReserved = value;
  }

  bool _emojiSad = false;
  bool get emojiSad => _emojiSad;
  set emojiSad(bool value) {
    _emojiSad = value;
  }

  bool _emojiAngry = false;
  bool get emojiAngry => _emojiAngry;
  set emojiAngry(bool value) {
    _emojiAngry = value;
  }

  bool _emojiDisappointed = false;
  bool get emojiDisappointed => _emojiDisappointed;
  set emojiDisappointed(bool value) {
    _emojiDisappointed = value;
  }

  bool _emojiHappy = false;
  bool get emojiHappy => _emojiHappy;
  set emojiHappy(bool value) {
    _emojiHappy = value;
  }

  bool _emojiEcstatic = false;
  bool get emojiEcstatic => _emojiEcstatic;
  set emojiEcstatic(bool value) {
    _emojiEcstatic = value;
  }

  String _UserID = '';
  String get UserID => _UserID;
  set UserID(String value) {
    _UserID = value;
  }

  List<DateTime> _moodCalendarchecker = [];
  List<DateTime> get moodCalendarchecker => _moodCalendarchecker;
  set moodCalendarchecker(List<DateTime> value) {
    _moodCalendarchecker = value;
  }

  void addToMoodCalendarchecker(DateTime value) {
    moodCalendarchecker.add(value);
  }

  void removeFromMoodCalendarchecker(DateTime value) {
    moodCalendarchecker.remove(value);
  }

  void removeAtIndexFromMoodCalendarchecker(int index) {
    moodCalendarchecker.removeAt(index);
  }

  void updateMoodCalendarcheckerAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    moodCalendarchecker[index] = updateFn(_moodCalendarchecker[index]);
  }

  void insertAtIndexInMoodCalendarchecker(int index, DateTime value) {
    moodCalendarchecker.insert(index, value);
  }

  int _angryCount = 0;
  int get angryCount => _angryCount;
  set angryCount(int value) {
    _angryCount = value;
  }

  int _sadCount = 0;
  int get sadCount => _sadCount;
  set sadCount(int value) {
    _sadCount = value;
  }

  int _disappointedCount = 0;
  int get disappointedCount => _disappointedCount;
  set disappointedCount(int value) {
    _disappointedCount = value;
  }

  int _happyCount = 0;
  int get happyCount => _happyCount;
  set happyCount(int value) {
    _happyCount = value;
  }

  int _delightedCount = 0;
  int get delightedCount => _delightedCount;
  set delightedCount(int value) {
    _delightedCount = value;
  }

  List<String> _emojiList = [];
  List<String> get emojiList => _emojiList;
  set emojiList(List<String> value) {
    _emojiList = value;
  }

  void addToEmojiList(String value) {
    emojiList.add(value);
  }

  void removeFromEmojiList(String value) {
    emojiList.remove(value);
  }

  void removeAtIndexFromEmojiList(int index) {
    emojiList.removeAt(index);
  }

  void updateEmojiListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emojiList[index] = updateFn(_emojiList[index]);
  }

  void insertAtIndexInEmojiList(int index, String value) {
    emojiList.insert(index, value);
  }

  List<bool> _favoriteIndex = [];
  List<bool> get favoriteIndex => _favoriteIndex;
  set favoriteIndex(List<bool> value) {
    _favoriteIndex = value;
  }

  void addToFavoriteIndex(bool value) {
    favoriteIndex.add(value);
  }

  void removeFromFavoriteIndex(bool value) {
    favoriteIndex.remove(value);
  }

  void removeAtIndexFromFavoriteIndex(int index) {
    favoriteIndex.removeAt(index);
  }

  void updateFavoriteIndexAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    favoriteIndex[index] = updateFn(_favoriteIndex[index]);
  }

  void insertAtIndexInFavoriteIndex(int index, bool value) {
    favoriteIndex.insert(index, value);
  }

  int _logCount = 0;
  int get logCount => _logCount;
  set logCount(int value) {
    _logCount = value;
  }

  List<String> _logList = [];
  List<String> get logList => _logList;
  set logList(List<String> value) {
    _logList = value;
  }

  void addToLogList(String value) {
    logList.add(value);
  }

  void removeFromLogList(String value) {
    logList.remove(value);
  }

  void removeAtIndexFromLogList(int index) {
    logList.removeAt(index);
  }

  void updateLogListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    logList[index] = updateFn(_logList[index]);
  }

  void insertAtIndexInLogList(int index, String value) {
    logList.insert(index, value);
  }

  bool _buttonColor = false;
  bool get buttonColor => _buttonColor;
  set buttonColor(bool value) {
    _buttonColor = value;
  }

  bool _notificationBadge = false;
  bool get notificationBadge => _notificationBadge;
  set notificationBadge(bool value) {
    _notificationBadge = value;
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    prefs.setBool('ff_isPlaying', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  int _happyCount = 0;
  int get happyCount => _happyCount;
  set happyCount(int value) {
    _happyCount = value;
  }

  int _excitedCount = 0;
  int get excitedCount => _excitedCount;
  set excitedCount(int value) {
    _excitedCount = value;
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

  bool _moodAngry = false;
  bool get moodAngry => _moodAngry;
  set moodAngry(bool value) {
    _moodAngry = value;
  }

  bool _moodAnnoyed = false;
  bool get moodAnnoyed => _moodAnnoyed;
  set moodAnnoyed(bool value) {
    _moodAnnoyed = value;
  }

  bool _moodAnxious = false;
  bool get moodAnxious => _moodAnxious;
  set moodAnxious(bool value) {
    _moodAnxious = value;
  }

  bool _moodBored = false;
  bool get moodBored => _moodBored;
  set moodBored(bool value) {
    _moodBored = value;
  }

  bool _moodExcited = false;
  bool get moodExcited => _moodExcited;
  set moodExcited(bool value) {
    _moodExcited = value;
  }

  bool _moodHappy = false;
  bool get moodHappy => _moodHappy;
  set moodHappy(bool value) {
    _moodHappy = value;
  }

  bool _moodLove = false;
  bool get moodLove => _moodLove;
  set moodLove(bool value) {
    _moodLove = value;
  }

  bool _moodPleasant = false;
  bool get moodPleasant => _moodPleasant;
  set moodPleasant(bool value) {
    _moodPleasant = value;
  }

  bool _moodSad = false;
  bool get moodSad => _moodSad;
  set moodSad(bool value) {
    _moodSad = value;
  }

  bool _moodSilly = false;
  bool get moodSilly => _moodSilly;
  set moodSilly(bool value) {
    _moodSilly = value;
  }

  String _moodClicked = '';
  String get moodClicked => _moodClicked;
  set moodClicked(String value) {
    _moodClicked = value;
  }

  String _moodName = '';
  String get moodName => _moodName;
  set moodName(String value) {
    _moodName = value;
  }

  bool _actFamily = false;
  bool get actFamily => _actFamily;
  set actFamily(bool value) {
    _actFamily = value;
  }

  bool _actFriends = false;
  bool get actFriends => _actFriends;
  set actFriends(bool value) {
    _actFriends = value;
  }

  bool _actLove = false;
  bool get actLove => _actLove;
  set actLove(bool value) {
    _actLove = value;
  }

  bool _actGym = false;
  bool get actGym => _actGym;
  set actGym(bool value) {
    _actGym = value;
  }

  bool _actWalk = false;
  bool get actWalk => _actWalk;
  set actWalk(bool value) {
    _actWalk = value;
  }

  bool _actJog = false;
  bool get actJog => _actJog;
  set actJog(bool value) {
    _actJog = value;
  }

  bool _actRun = false;
  bool get actRun => _actRun;
  set actRun(bool value) {
    _actRun = value;
  }

  bool _actEat = false;
  bool get actEat => _actEat;
  set actEat(bool value) {
    _actEat = value;
  }

  bool _actRelax = false;
  bool get actRelax => _actRelax;
  set actRelax(bool value) {
    _actRelax = value;
  }

  bool _actClean = false;
  bool get actClean => _actClean;
  set actClean(bool value) {
    _actClean = value;
  }

  bool _actGame = false;
  bool get actGame => _actGame;
  set actGame(bool value) {
    _actGame = value;
  }

  bool _actRead = false;
  bool get actRead => _actRead;
  set actRead(bool value) {
    _actRead = value;
  }

  bool _actWatch = false;
  bool get actWatch => _actWatch;
  set actWatch(bool value) {
    _actWatch = value;
  }

  bool _actTravel = false;
  bool get actTravel => _actTravel;
  set actTravel(bool value) {
    _actTravel = value;
  }

  List<String> _acts = [];
  List<String> get acts => _acts;
  set acts(List<String> value) {
    _acts = value;
  }

  void addToActs(String value) {
    acts.add(value);
  }

  void removeFromActs(String value) {
    acts.remove(value);
  }

  void removeAtIndexFromActs(int index) {
    acts.removeAt(index);
  }

  void updateActsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    acts[index] = updateFn(_acts[index]);
  }

  void insertAtIndexInActs(int index, String value) {
    acts.insert(index, value);
  }

  String _randomQuote = '';
  String get randomQuote => _randomQuote;
  set randomQuote(String value) {
    _randomQuote = value;
  }

  String _randomAuthor = '';
  String get randomAuthor => _randomAuthor;
  set randomAuthor(String value) {
    _randomAuthor = value;
  }

  List<DocumentReference> _actDocuments = [];
  List<DocumentReference> get actDocuments => _actDocuments;
  set actDocuments(List<DocumentReference> value) {
    _actDocuments = value;
  }

  void addToActDocuments(DocumentReference value) {
    actDocuments.add(value);
  }

  void removeFromActDocuments(DocumentReference value) {
    actDocuments.remove(value);
  }

  void removeAtIndexFromActDocuments(int index) {
    actDocuments.removeAt(index);
  }

  void updateActDocumentsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    actDocuments[index] = updateFn(_actDocuments[index]);
  }

  void insertAtIndexInActDocuments(int index, DocumentReference value) {
    actDocuments.insert(index, value);
  }

  List<DocumentReference> _actImages = [];
  List<DocumentReference> get actImages => _actImages;
  set actImages(List<DocumentReference> value) {
    _actImages = value;
  }

  void addToActImages(DocumentReference value) {
    actImages.add(value);
  }

  void removeFromActImages(DocumentReference value) {
    actImages.remove(value);
  }

  void removeAtIndexFromActImages(int index) {
    actImages.removeAt(index);
  }

  void updateActImagesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    actImages[index] = updateFn(_actImages[index]);
  }

  void insertAtIndexInActImages(int index, DocumentReference value) {
    actImages.insert(index, value);
  }

  String _moodLabel = '';
  String get moodLabel => _moodLabel;
  set moodLabel(String value) {
    _moodLabel = value;
  }

  double _MoodScore = 0.0;
  double get MoodScore => _MoodScore;
  set MoodScore(double value) {
    _MoodScore = value;
  }

  int _loveCount = 0;
  int get loveCount => _loveCount;
  set loveCount(int value) {
    _loveCount = value;
  }

  int _sillyCount = 0;
  int get sillyCount => _sillyCount;
  set sillyCount(int value) {
    _sillyCount = value;
  }

  int _pleasantCount = 0;
  int get pleasantCount => _pleasantCount;
  set pleasantCount(int value) {
    _pleasantCount = value;
  }

  int _boredCount = 0;
  int get boredCount => _boredCount;
  set boredCount(int value) {
    _boredCount = value;
  }

  int _annoyedCount = 0;
  int get annoyedCount => _annoyedCount;
  set annoyedCount(int value) {
    _annoyedCount = value;
  }

  int _sadCount = 0;
  int get sadCount => _sadCount;
  set sadCount(int value) {
    _sadCount = value;
  }

  int _anxiousCount = 0;
  int get anxiousCount => _anxiousCount;
  set anxiousCount(int value) {
    _anxiousCount = value;
  }

  int _gymCount = 0;
  int get gymCount => _gymCount;
  set gymCount(int value) {
    _gymCount = value;
  }

  int _familyCount = 0;
  int get familyCount => _familyCount;
  set familyCount(int value) {
    _familyCount = value;
  }

  List<int> _activityList = [];
  List<int> get activityList => _activityList;
  set activityList(List<int> value) {
    _activityList = value;
  }

  void addToActivityList(int value) {
    activityList.add(value);
  }

  void removeFromActivityList(int value) {
    activityList.remove(value);
  }

  void removeAtIndexFromActivityList(int index) {
    activityList.removeAt(index);
  }

  void updateActivityListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    activityList[index] = updateFn(_activityList[index]);
  }

  void insertAtIndexInActivityList(int index, int value) {
    activityList.insert(index, value);
  }

  List<String> _activityList1 = [];
  List<String> get activityList1 => _activityList1;
  set activityList1(List<String> value) {
    _activityList1 = value;
  }

  void addToActivityList1(String value) {
    activityList1.add(value);
  }

  void removeFromActivityList1(String value) {
    activityList1.remove(value);
  }

  void removeAtIndexFromActivityList1(int index) {
    activityList1.removeAt(index);
  }

  void updateActivityList1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    activityList1[index] = updateFn(_activityList1[index]);
  }

  void insertAtIndexInActivityList1(int index, String value) {
    activityList1.insert(index, value);
  }

  int _jogCount = 0;
  int get jogCount => _jogCount;
  set jogCount(int value) {
    _jogCount = value;
  }

  int _gameCount = 0;
  int get gameCount => _gameCount;
  set gameCount(int value) {
    _gameCount = value;
  }

  int _readCount = 0;
  int get readCount => _readCount;
  set readCount(int value) {
    _readCount = value;
  }

  int _cleanCount = 0;
  int get cleanCount => _cleanCount;
  set cleanCount(int value) {
    _cleanCount = value;
  }

  int _watchCount = 0;
  int get watchCount => _watchCount;
  set watchCount(int value) {
    _watchCount = value;
  }

  int _runCount = 0;
  int get runCount => _runCount;
  set runCount(int value) {
    _runCount = value;
  }

  int _walkCount = 0;
  int get walkCount => _walkCount;
  set walkCount(int value) {
    _walkCount = value;
  }

  int _travelCount = 0;
  int get travelCount => _travelCount;
  set travelCount(int value) {
    _travelCount = value;
  }

  int _friendsCount = 0;
  int get friendsCount => _friendsCount;
  set friendsCount(int value) {
    _friendsCount = value;
  }

  int _relaxCount = 0;
  int get relaxCount => _relaxCount;
  set relaxCount(int value) {
    _relaxCount = value;
  }

  int _dateCount = 0;
  int get dateCount => _dateCount;
  set dateCount(int value) {
    _dateCount = value;
  }

  int _eatCount = 0;
  int get eatCount => _eatCount;
  set eatCount(int value) {
    _eatCount = value;
  }

  List<int> _actCountList = [];
  List<int> get actCountList => _actCountList;
  set actCountList(List<int> value) {
    _actCountList = value;
  }

  void addToActCountList(int value) {
    actCountList.add(value);
  }

  void removeFromActCountList(int value) {
    actCountList.remove(value);
  }

  void removeAtIndexFromActCountList(int index) {
    actCountList.removeAt(index);
  }

  void updateActCountListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    actCountList[index] = updateFn(_actCountList[index]);
  }

  void insertAtIndexInActCountList(int index, int value) {
    actCountList.insert(index, value);
  }

  List<double> _weeklyMoodCounts = [];
  List<double> get weeklyMoodCounts => _weeklyMoodCounts;
  set weeklyMoodCounts(List<double> value) {
    _weeklyMoodCounts = value;
  }

  void addToWeeklyMoodCounts(double value) {
    weeklyMoodCounts.add(value);
  }

  void removeFromWeeklyMoodCounts(double value) {
    weeklyMoodCounts.remove(value);
  }

  void removeAtIndexFromWeeklyMoodCounts(int index) {
    weeklyMoodCounts.removeAt(index);
  }

  void updateWeeklyMoodCountsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    weeklyMoodCounts[index] = updateFn(_weeklyMoodCounts[index]);
  }

  void insertAtIndexInWeeklyMoodCounts(int index, double value) {
    weeklyMoodCounts.insert(index, value);
  }

  String _dominantMood = '';
  String get dominantMood => _dominantMood;
  set dominantMood(String value) {
    _dominantMood = value;
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : ALogoWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : ALogoWidget(),
        ),
        FFRoute(
          name: VerificationPageWidget.routeName,
          path: VerificationPageWidget.routePath,
          builder: (context, params) => VerificationPageWidget(),
        ),
        FFRoute(
          name: MyProfilePageWidget.routeName,
          path: MyProfilePageWidget.routePath,
          builder: (context, params) => MyProfilePageWidget(),
        ),
        FFRoute(
          name: DataPolicyPageWidget.routeName,
          path: DataPolicyPageWidget.routePath,
          builder: (context, params) => DataPolicyPageWidget(),
        ),
        FFRoute(
          name: DeleteAccountPageWidget.routeName,
          path: DeleteAccountPageWidget.routePath,
          builder: (context, params) => DeleteAccountPageWidget(),
        ),
        FFRoute(
          name: EditProfilePageWidget.routeName,
          path: EditProfilePageWidget.routePath,
          builder: (context, params) => EditProfilePageWidget(),
        ),
        FFRoute(
          name: TermsPoliciesPageWidget.routeName,
          path: TermsPoliciesPageWidget.routePath,
          builder: (context, params) => TermsPoliciesPageWidget(),
        ),
        FFRoute(
          name: TermsConditionsPageWidget.routeName,
          path: TermsConditionsPageWidget.routePath,
          builder: (context, params) => TermsConditionsPageWidget(),
        ),
        FFRoute(
          name: DiscoveryPageWidget.routeName,
          path: DiscoveryPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Discovery_page')
              : DiscoveryPageWidget(),
        ),
        FFRoute(
          name: HomepageWidget.routeName,
          path: HomepageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Homepage')
              : HomepageWidget(),
        ),
        FFRoute(
          name: SelfHelpPageWidget.routeName,
          path: SelfHelpPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'SelfHelp_page')
              : SelfHelpPageWidget(
                  logs: params.getParam(
                    'logs',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['mood_tracker'],
                  ),
                ),
        ),
        FFRoute(
          name: MentalResourceListStep1Widget.routeName,
          path: MentalResourceListStep1Widget.routePath,
          builder: (context, params) => MentalResourceListStep1Widget(),
        ),
        FFRoute(
          name: AcademicSuccessPageWidget.routeName,
          path: AcademicSuccessPageWidget.routePath,
          builder: (context, params) => AcademicSuccessPageWidget(),
        ),
        FFRoute(
          name: AcademicContent2Widget.routeName,
          path: AcademicContent2Widget.routePath,
          builder: (context, params) => AcademicContent2Widget(),
        ),
        FFRoute(
          name: AnxietyPageWidget.routeName,
          path: AnxietyPageWidget.routePath,
          builder: (context, params) => AnxietyPageWidget(),
        ),
        FFRoute(
          name: Anxiety1Widget.routeName,
          path: Anxiety1Widget.routePath,
          builder: (context, params) => Anxiety1Widget(),
        ),
        FFRoute(
          name: Anxiety2Widget.routeName,
          path: Anxiety2Widget.routePath,
          builder: (context, params) => Anxiety2Widget(),
        ),
        FFRoute(
          name: DepressionPageWidget.routeName,
          path: DepressionPageWidget.routePath,
          builder: (context, params) => DepressionPageWidget(),
        ),
        FFRoute(
          name: Depression1Widget.routeName,
          path: Depression1Widget.routePath,
          builder: (context, params) => Depression1Widget(),
        ),
        FFRoute(
          name: Depression2Widget.routeName,
          path: Depression2Widget.routePath,
          builder: (context, params) => Depression2Widget(),
        ),
        FFRoute(
          name: Depression3Widget.routeName,
          path: Depression3Widget.routePath,
          builder: (context, params) => Depression3Widget(),
        ),
        FFRoute(
          name: MessagePageWidget.routeName,
          path: MessagePageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Message_page')
              : MessagePageWidget(),
        ),
        FFRoute(
          name: RicoWidget.routeName,
          path: RicoWidget.routePath,
          builder: (context, params) => RicoWidget(),
        ),
        FFRoute(
          name: LargadasWidget.routeName,
          path: LargadasWidget.routePath,
          builder: (context, params) => LargadasWidget(),
        ),
        FFRoute(
          name: BorjaWidget.routeName,
          path: BorjaWidget.routePath,
          builder: (context, params) => BorjaWidget(),
        ),
        FFRoute(
          name: BelloWidget.routeName,
          path: BelloWidget.routePath,
          builder: (context, params) => BelloWidget(),
        ),
        FFRoute(
          name: ObnamiaWidget.routeName,
          path: ObnamiaWidget.routePath,
          builder: (context, params) => ObnamiaWidget(),
        ),
        FFRoute(
          name: UpdatesPageWidget.routeName,
          path: UpdatesPageWidget.routePath,
          builder: (context, params) => UpdatesPageWidget(),
        ),
        FFRoute(
          name: PeerWidget.routeName,
          path: PeerWidget.routePath,
          builder: (context, params) => PeerWidget(),
        ),
        FFRoute(
          name: NotificationsPageWidget.routeName,
          path: NotificationsPageWidget.routePath,
          builder: (context, params) => NotificationsPageWidget(),
        ),
        FFRoute(
          name: FavouritesPageWidget.routeName,
          path: FavouritesPageWidget.routePath,
          builder: (context, params) => FavouritesPageWidget(),
        ),
        FFRoute(
          name: AppFeedbacksPageWidget.routeName,
          path: AppFeedbacksPageWidget.routePath,
          builder: (context, params) => AppFeedbacksPageWidget(),
        ),
        FFRoute(
          name: ChatPageWidget.routeName,
          path: ChatPageWidget.routePath,
          builder: (context, params) => ChatPageWidget(
            receiveChat: params.getParam(
              'receiveChat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: CreateAccount1PageWidget.routeName,
          path: CreateAccount1PageWidget.routePath,
          builder: (context, params) => CreateAccount1PageWidget(),
        ),
        FFRoute(
          name: AcademicContent1Widget.routeName,
          path: AcademicContent1Widget.routePath,
          builder: (context, params) => AcademicContent1Widget(),
        ),
        FFRoute(
          name: BLoginWidget.routeName,
          path: BLoginWidget.routePath,
          builder: (context, params) => BLoginWidget(),
        ),
        FFRoute(
          name: ALogoWidget.routeName,
          path: ALogoWidget.routePath,
          builder: (context, params) => ALogoWidget(),
        ),
        FFRoute(
          name: BLoWidget.routeName,
          path: BLoWidget.routePath,
          builder: (context, params) => BLoWidget(),
        ),
        FFRoute(
          name: BLoginRegisterWidget.routeName,
          path: BLoginRegisterWidget.routePath,
          builder: (context, params) => BLoginRegisterWidget(),
        ),
        FFRoute(
          name: BLoginForgotWidget.routeName,
          path: BLoginForgotWidget.routePath,
          builder: (context, params) => BLoginForgotWidget(),
        ),
        FFRoute(
          name: EmotionalPageWidget.routeName,
          path: EmotionalPageWidget.routePath,
          builder: (context, params) => EmotionalPageWidget(),
        ),
        FFRoute(
          name: Emotional1Widget.routeName,
          path: Emotional1Widget.routePath,
          builder: (context, params) => Emotional1Widget(),
        ),
        FFRoute(
          name: Emotional2Widget.routeName,
          path: Emotional2Widget.routePath,
          builder: (context, params) => Emotional2Widget(),
        ),
        FFRoute(
          name: Emotional3Widget.routeName,
          path: Emotional3Widget.routePath,
          builder: (context, params) => Emotional3Widget(),
        ),
        FFRoute(
          name: FamilyPageWidget.routeName,
          path: FamilyPageWidget.routePath,
          builder: (context, params) => FamilyPageWidget(),
        ),
        FFRoute(
          name: Family1Widget.routeName,
          path: Family1Widget.routePath,
          builder: (context, params) => Family1Widget(),
        ),
        FFRoute(
          name: SuicidalPageWidget.routeName,
          path: SuicidalPageWidget.routePath,
          builder: (context, params) => SuicidalPageWidget(),
        ),
        FFRoute(
          name: GriefPageWidget.routeName,
          path: GriefPageWidget.routePath,
          builder: (context, params) => GriefPageWidget(),
        ),
        FFRoute(
          name: Grief1Widget.routeName,
          path: Grief1Widget.routePath,
          builder: (context, params) => Grief1Widget(),
        ),
        FFRoute(
          name: HabitsPageWidget.routeName,
          path: HabitsPageWidget.routePath,
          builder: (context, params) => HabitsPageWidget(),
        ),
        FFRoute(
          name: Habits1Widget.routeName,
          path: Habits1Widget.routePath,
          builder: (context, params) => Habits1Widget(),
        ),
        FFRoute(
          name: SubstancePageWidget.routeName,
          path: SubstancePageWidget.routePath,
          builder: (context, params) => SubstancePageWidget(),
        ),
        FFRoute(
          name: TraumaPageWidget.routeName,
          path: TraumaPageWidget.routePath,
          builder: (context, params) => TraumaPageWidget(),
        ),
        FFRoute(
          name: Substance1Widget.routeName,
          path: Substance1Widget.routePath,
          builder: (context, params) => Substance1Widget(),
        ),
        FFRoute(
          name: Substance2Widget.routeName,
          path: Substance2Widget.routePath,
          builder: (context, params) => Substance2Widget(),
        ),
        FFRoute(
          name: Suicidal1Widget.routeName,
          path: Suicidal1Widget.routePath,
          builder: (context, params) => Suicidal1Widget(),
        ),
        FFRoute(
          name: GrowthMindset1Widget.routeName,
          path: GrowthMindset1Widget.routePath,
          builder: (context, params) => GrowthMindset1Widget(),
        ),
        FFRoute(
          name: CheckVerificationPageWidget.routeName,
          path: CheckVerificationPageWidget.routePath,
          builder: (context, params) => CheckVerificationPageWidget(),
        ),
        FFRoute(
          name: MoodLogsWidget.routeName,
          path: MoodLogsWidget.routePath,
          builder: (context, params) => MoodLogsWidget(),
        ),
        FFRoute(
          name: SessionPageWidget.routeName,
          path: SessionPageWidget.routePath,
          builder: (context, params) => SessionPageWidget(),
        ),
        FFRoute(
          name: ReservationPage1Widget.routeName,
          path: ReservationPage1Widget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Reservation_Page1')
              : ReservationPage1Widget(),
        ),
        FFRoute(
          name: OnboardingPage1Widget.routeName,
          path: OnboardingPage1Widget.routePath,
          builder: (context, params) => OnboardingPage1Widget(),
        ),
        FFRoute(
          name: OnboardingPage2Widget.routeName,
          path: OnboardingPage2Widget.routePath,
          builder: (context, params) => OnboardingPage2Widget(),
        ),
        FFRoute(
          name: OnboardingPage3Widget.routeName,
          path: OnboardingPage3Widget.routePath,
          builder: (context, params) => OnboardingPage3Widget(),
        ),
        FFRoute(
          name: OnboardingPage4Widget.routeName,
          path: OnboardingPage4Widget.routePath,
          builder: (context, params) => OnboardingPage4Widget(),
        ),
        FFRoute(
          name: OnboardingPage5Widget.routeName,
          path: OnboardingPage5Widget.routePath,
          builder: (context, params) => OnboardingPage5Widget(),
        ),
        FFRoute(
          name: MoodSummaryWidget.routeName,
          path: MoodSummaryWidget.routePath,
          builder: (context, params) => MoodSummaryWidget(),
        ),
        FFRoute(
          name: ReservationPage3Widget.routeName,
          path: ReservationPage3Widget.routePath,
          builder: (context, params) => ReservationPage3Widget(
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
            timeSelected: params.getParam(
              'timeSelected',
              ParamType.DateTime,
            ),
            ownerRef: params.getParam(
              'ownerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            sessionType: params.getParam(
              'sessionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MentalResourceListztryWidget.routeName,
          path: MentalResourceListztryWidget.routePath,
          builder: (context, params) => MentalResourceListztryWidget(),
        ),
        FFRoute(
          name: FavouritesPageCopyWidget.routeName,
          path: FavouritesPageCopyWidget.routePath,
          builder: (context, params) => FavouritesPageCopyWidget(),
        ),
        FFRoute(
          name: BreatheIrritationWidget.routeName,
          path: BreatheIrritationWidget.routePath,
          builder: (context, params) => BreatheIrritationWidget(),
        ),
        FFRoute(
          name: ReservationPage2Widget.routeName,
          path: ReservationPage2Widget.routePath,
          builder: (context, params) => ReservationPage2Widget(
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
            sessionType: params.getParam(
              'sessionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Discoverry1Widget.routeName,
          path: Discoverry1Widget.routePath,
          builder: (context, params) => Discoverry1Widget(
            adminRef: params.getParam(
              'adminRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: RoxasWidget.routeName,
          path: RoxasWidget.routePath,
          builder: (context, params) => RoxasWidget(),
        ),
        FFRoute(
          name: CaguioaWidget.routeName,
          path: CaguioaWidget.routePath,
          builder: (context, params) => CaguioaWidget(),
        ),
        FFRoute(
          name: MentalResourceWidget.routeName,
          path: MentalResourceWidget.routePath,
          builder: (context, params) => MentalResourceWidget(),
        ),
        FFRoute(
          name: AcademicContent1CopyWidget.routeName,
          path: AcademicContent1CopyWidget.routePath,
          builder: (context, params) => AcademicContent1CopyWidget(),
        ),
        FFRoute(
          name: SeminarWidget.routeName,
          path: SeminarWidget.routePath,
          builder: (context, params) => SeminarWidget(),
        ),
        FFRoute(
          name: AccountPageCopyWidget.routeName,
          path: AccountPageCopyWidget.routePath,
          builder: (context, params) => AccountPageCopyWidget(),
        ),
        FFRoute(
          name: BLoCopyWidget.routeName,
          path: BLoCopyWidget.routePath,
          builder: (context, params) => BLoCopyWidget(),
        ),
        FFRoute(
          name: VerificationPageCopyWidget.routeName,
          path: VerificationPageCopyWidget.routePath,
          builder: (context, params) => VerificationPageCopyWidget(),
        ),
        FFRoute(
          name: SessionFeedbackPageWidget.routeName,
          path: SessionFeedbackPageWidget.routePath,
          builder: (context, params) => SessionFeedbackPageWidget(),
        ),
        FFRoute(
          name: AccountPageCopy2Widget.routeName,
          path: AccountPageCopy2Widget.routePath,
          builder: (context, params) => AccountPageCopy2Widget(),
        ),
        FFRoute(
          name: MessagePageCopy2Widget.routeName,
          path: MessagePageCopy2Widget.routePath,
          builder: (context, params) => MessagePageCopy2Widget(),
        ),
        FFRoute(
          name: SelfHelpPageEmergencyCopyWidget.routeName,
          path: SelfHelpPageEmergencyCopyWidget.routePath,
          builder: (context, params) => SelfHelpPageEmergencyCopyWidget(
            logs: params.getParam(
              'logs',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['mood_tracker'],
            ),
          ),
        ),
        FFRoute(
          name: ReservationPage1SOSCopyWidget.routeName,
          path: ReservationPage1SOSCopyWidget.routePath,
          builder: (context, params) => ReservationPage1SOSCopyWidget(),
        ),
        FFRoute(
          name: ReservationPage2SOSCopyWidget.routeName,
          path: ReservationPage2SOSCopyWidget.routePath,
          builder: (context, params) => ReservationPage2SOSCopyWidget(
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
            sessionType: params.getParam(
              'sessionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReservationPage3SOSCopyWidget.routeName,
          path: ReservationPage3SOSCopyWidget.routePath,
          builder: (context, params) => ReservationPage3SOSCopyWidget(
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
            timeSelected: params.getParam(
              'timeSelected',
              ParamType.DateTime,
            ),
            ownerRef: params.getParam(
              'ownerRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            sessionType: params.getParam(
              'sessionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DataPoliciesPageWidget.routeName,
          path: DataPoliciesPageWidget.routePath,
          builder: (context, params) => DataPoliciesPageWidget(),
        ),
        FFRoute(
          name: DiscoveryPageEmergencyCopyWidget.routeName,
          path: DiscoveryPageEmergencyCopyWidget.routePath,
          builder: (context, params) => DiscoveryPageEmergencyCopyWidget(),
        ),
        FFRoute(
          name: MoodLogsCopyWidget.routeName,
          path: MoodLogsCopyWidget.routePath,
          builder: (context, params) => MoodLogsCopyWidget(),
        ),
        FFRoute(
          name: ReservationPage22Widget.routeName,
          path: ReservationPage22Widget.routePath,
          builder: (context, params) => ReservationPage22Widget(
            classRef: params.getParam(
              'classRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['classes'],
            ),
            sessionType: params.getParam(
              'sessionType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: BreatheAnxietyWidget.routeName,
          path: BreatheAnxietyWidget.routePath,
          builder: (context, params) => BreatheAnxietyWidget(),
        ),
        FFRoute(
          name: BreathingAngryWidget.routeName,
          path: BreathingAngryWidget.routePath,
          builder: (context, params) => BreathingAngryWidget(),
        ),
        FFRoute(
          name: BreathingFearWidget.routeName,
          path: BreathingFearWidget.routePath,
          builder: (context, params) => BreathingFearWidget(),
        ),
        FFRoute(
          name: BreatheSadWidget.routeName,
          path: BreatheSadWidget.routePath,
          builder: (context, params) => BreatheSadWidget(),
        ),
        FFRoute(
          name: BreatheWorriedWidget.routeName,
          path: BreatheWorriedWidget.routePath,
          builder: (context, params) => BreatheWorriedWidget(),
        ),
        FFRoute(
          name: MyProfilePageCopyWidget.routeName,
          path: MyProfilePageCopyWidget.routePath,
          builder: (context, params) => MyProfilePageCopyWidget(),
        ),
        FFRoute(
          name: GrowthMindsetPageWidget.routeName,
          path: GrowthMindsetPageWidget.routePath,
          builder: (context, params) => GrowthMindsetPageWidget(),
        ),
        FFRoute(
          name: Trauma1Widget.routeName,
          path: Trauma1Widget.routePath,
          builder: (context, params) => Trauma1Widget(),
        ),
        FFRoute(
          name: GrowthMindset2Widget.routeName,
          path: GrowthMindset2Widget.routePath,
          builder: (context, params) => GrowthMindset2Widget(),
        ),
        FFRoute(
          name: MotivationPageWidget.routeName,
          path: MotivationPageWidget.routePath,
          builder: (context, params) => MotivationPageWidget(),
        ),
        FFRoute(
          name: Motivation1Widget.routeName,
          path: Motivation1Widget.routePath,
          builder: (context, params) => Motivation1Widget(),
        ),
        FFRoute(
          name: Motivation2Widget.routeName,
          path: Motivation2Widget.routePath,
          builder: (context, params) => Motivation2Widget(),
        ),
        FFRoute(
          name: Motivation3Widget.routeName,
          path: Motivation3Widget.routePath,
          builder: (context, params) => Motivation3Widget(),
        ),
        FFRoute(
          name: Motivation4Widget.routeName,
          path: Motivation4Widget.routePath,
          builder: (context, params) => Motivation4Widget(),
        ),
        FFRoute(
          name: PositivePsychologyPageWidget.routeName,
          path: PositivePsychologyPageWidget.routePath,
          builder: (context, params) => PositivePsychologyPageWidget(),
        ),
        FFRoute(
          name: PositivePsychology1Widget.routeName,
          path: PositivePsychology1Widget.routePath,
          builder: (context, params) => PositivePsychology1Widget(),
        ),
        FFRoute(
          name: Confidence1Widget.routeName,
          path: Confidence1Widget.routePath,
          builder: (context, params) => Confidence1Widget(),
        ),
        FFRoute(
          name: ConfidencePageWidget.routeName,
          path: ConfidencePageWidget.routePath,
          builder: (context, params) => ConfidencePageWidget(),
        ),
        FFRoute(
          name: MoodTracker1NewActivityWidget.routeName,
          path: MoodTracker1NewActivityWidget.routePath,
          builder: (context, params) => MoodTracker1NewActivityWidget(
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: MoodTracker2NewActivityWidget.routeName,
          path: MoodTracker2NewActivityWidget.routePath,
          builder: (context, params) => MoodTracker2NewActivityWidget(
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: MoodWidget.routeName,
          path: MoodWidget.routePath,
          builder: (context, params) => MoodWidget(),
        ),
        FFRoute(
          name: MoodTracker3NewActivityWidget.routeName,
          path: MoodTracker3NewActivityWidget.routePath,
          builder: (context, params) => MoodTracker3NewActivityWidget(),
        ),
        FFRoute(
          name: BreatheEnergizeWidget.routeName,
          path: BreatheEnergizeWidget.routePath,
          builder: (context, params) => BreatheEnergizeWidget(),
        ),
        FFRoute(
          name: BreatheDeeprelaxWidget.routeName,
          path: BreatheDeeprelaxWidget.routePath,
          builder: (context, params) => BreatheDeeprelaxWidget(),
        ),
        FFRoute(
          name: BreathCalmWidget.routeName,
          path: BreathCalmWidget.routePath,
          builder: (context, params) => BreathCalmWidget(),
        ),
        FFRoute(
          name: BreatheJoyWidget.routeName,
          path: BreatheJoyWidget.routePath,
          builder: (context, params) => BreatheJoyWidget(),
        ),
        FFRoute(
          name: NewsWidget.routeName,
          path: NewsWidget.routePath,
          builder: (context, params) => NewsWidget(
            index: params.getParam(
              'index',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['news'],
            ),
            titleIndex: params.getParam(
              'titleIndex',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MentalResourceListzWidget.routeName,
          path: MentalResourceListzWidget.routePath,
          builder: (context, params) => MentalResourceListzWidget(),
        ),
        FFRoute(
          name: MentalResourceListStep2Widget.routeName,
          path: MentalResourceListStep2Widget.routePath,
          builder: (context, params) => MentalResourceListStep2Widget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MentalResourceListStep3Widget.routeName,
          path: MentalResourceListStep3Widget.routePath,
          builder: (context, params) => MentalResourceListStep3Widget(
            postTitle: params.getParam(
              'postTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MoodSummaryCopyWidget.routeName,
          path: MoodSummaryCopyWidget.routePath,
          builder: (context, params) => MoodSummaryCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/aLogo';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF19C5C5),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.none,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

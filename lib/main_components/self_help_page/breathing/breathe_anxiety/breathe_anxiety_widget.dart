import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'breathe_anxiety_model.dart';
export 'breathe_anxiety_model.dart';

class BreatheAnxietyWidget extends StatefulWidget {
  const BreatheAnxietyWidget({super.key});

  static String routeName = 'Breathe_anxiety';
  static String routePath = '/breatheAnxiety';

  @override
  State<BreatheAnxietyWidget> createState() => _BreatheAnxietyWidgetState();
}

class _BreatheAnxietyWidgetState extends State<BreatheAnxietyWidget> {
  late BreatheAnxietyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreatheAnxietyModel());

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
        backgroundColor: Color(0xFF15C5C5),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowVideoPlayer(
                  path: 'assets/videos/Anxiety.mp4',
                  videoType: VideoType.asset,
                  width: double.infinity,
                  height: double.infinity,
                  autoPlay: true,
                  looping: false,
                  showControls: false,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                  lazyLoad: false,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.84, -0.9),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(SelfHelpPageWidget.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

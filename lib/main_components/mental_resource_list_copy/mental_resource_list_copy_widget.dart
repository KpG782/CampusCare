import '/backend/backend.dart';
import '/components/resources_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'mental_resource_list_copy_model.dart';
export 'mental_resource_list_copy_model.dart';

class MentalResourceListCopyWidget extends StatefulWidget {
  const MentalResourceListCopyWidget({super.key});

  static String routeName = 'MentalResource_listCopy';
  static String routePath = '/mentalResourceListCopy';

  @override
  State<MentalResourceListCopyWidget> createState() =>
      _MentalResourceListCopyWidgetState();
}

class _MentalResourceListCopyWidgetState
    extends State<MentalResourceListCopyWidget> {
  late MentalResourceListCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MentalResourceListCopyModel());

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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: FlutterFlowTheme.of(context).text1,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'Mental Resources',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Inter Tight',
                                color: FlutterFlowTheme.of(context).text1,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(width: 10.0))
                        .around(SizedBox(width: 10.0)),
                  ),
                ),
                StreamBuilder<List<MentalResourcesRecord>>(
                  stream: queryMentalResourcesRecord(),
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
                        listViewMentalResourcesRecordList = snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewMentalResourcesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewMentalResourcesRecord =
                            listViewMentalResourcesRecordList[listViewIndex];
                        return ResourcesListWidget(
                          key: Key(
                              'Keyrp8_${listViewIndex}_of_${listViewMentalResourcesRecordList.length}'),
                          parameter1: listViewMentalResourcesRecord.mentalImage,
                          parameter2: valueOrDefault<String>(
                            listViewMentalResourcesRecord.mentalTitle,
                            'empty',
                          ),
                          parameter3: listViewMentalResourcesRecord.reference,
                          parameter4: valueOrDefault<String>(
                            listViewMentalResourcesRecord.mentalDescription,
                            'empty',
                          ),
                          index: listViewIndex,
                          favorite:
                              listViewMentalResourcesRecord.mentalFavorite,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

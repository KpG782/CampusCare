import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'resources_list_model.dart';
export 'resources_list_model.dart';

class ResourcesListWidget extends StatefulWidget {
  const ResourcesListWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    required this.index,
    required this.favorite,
  });

  final String? parameter1;
  final String? parameter2;
  final DocumentReference? parameter3;
  final String? parameter4;
  final int? index;
  final bool? favorite;

  @override
  State<ResourcesListWidget> createState() => _ResourcesListWidgetState();
}

class _ResourcesListWidgetState extends State<ResourcesListWidget> {
  late ResourcesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourcesListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.index == 0) {
          context.pushNamed(AcademicSuccessPageWidget.routeName);
        } else {
          if (widget.index == 1) {
            context.pushNamed(AnxietyPageWidget.routeName);
          }
        }
      },
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background2,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: FlutterFlowTheme.of(context).shadow,
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22.0),
                child: Image.network(
                  widget.parameter1!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  widget.parameter2!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ToggleIcon(
                                onPressed: () async {
                                  safeSetState(() =>
                                      _model.favorite = !_model.favorite!);
                                  _model.favorite = widget.favorite;
                                  _model.updatePage(() {});

                                  await widget.parameter3!
                                      .update(createMentalResourcesRecordData(
                                    mentalFavorite: _model.favorite,
                                  ));
                                },
                                value: _model.favorite!,
                                onIcon: Icon(
                                  Icons.favorite_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                offIcon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.parameter4!,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
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
            ),
          ],
        ),
      ),
    );
  }
}

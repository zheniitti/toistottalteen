import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_liike_model.dart';
export 'bottom_sheet_liike_model.dart';

class BottomSheetLiikeWidget extends StatefulWidget {
  const BottomSheetLiikeWidget({
    Key? key,
    this.sessioDoc,
    this.liikeIndex,
  }) : super(key: key);

  final TreeniSessiotRecord? sessioDoc;
  final int? liikeIndex;

  @override
  _BottomSheetLiikeWidgetState createState() => _BottomSheetLiikeWidgetState();
}

class _BottomSheetLiikeWidgetState extends State<BottomSheetLiikeWidget> {
  late BottomSheetLiikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetLiikeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, -3.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 300.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOTTOM_SHEET_LIIKE_ListTile_qnrl7udd_ON_');
                      logFirebaseEvent('ListTile_update_app_state');
                      FFAppState().kopioidutLiikkeet = functions
                          .liikeToLiikeJsonList(
                              widget.sessioDoc!.treeniRutiiniData.liikkeet
                                  ?.toList()?[widget.liikeIndex??-1],
                              functions.nullLiikeList()?.toList())!
                          .toList();
                      logFirebaseEvent('ListTile_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          '9s0xqn9g' /* Kopioi liike */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.content_copy_rounded,
                        color: Color(0xFF303030),
                        size: 30.0,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().kopioidutLiikkeet.length > 0)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 300.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'BOTTOM_SHEET_LIIKE_ListTile_7lcrp35l_ON_');
                            logFirebaseEvent(
                                'ListTile_close_dialog,_drawer,_etc');
                            Navigator.pop(context);
                            if (widget.sessioDoc != null) {
                              logFirebaseEvent('ListTile_custom_action');
                              _model.updatedRutiiniCopy =
                                  await actions.myUpdateTreeniRutiiniStruct(
                                widget.sessioDoc!.treeniRutiiniData,
                                null,
                                null,
                                widget.sessioDoc!.treeniRutiiniData.liikkeet
                                    ?.toList()
                                    ?.toList(),
                                null,
                                null,
                                null,
                                null,
                                null,
                                null,
                                widget.liikeIndex,
                                null,
                                null,
                                null,
                                null,
                                widget.liikeIndex,
                                FFAppState().kopioidutLiikkeet.toList(),
                                true,
                                false,
                              );
                              logFirebaseEvent('ListTile_backend_call');

                              final treeniSessiotUpdateData =
                                  createTreeniSessiotRecordData(
                                treeniRutiiniData: updateTreeniRutiiniStruct(
                                  _model.updatedRutiiniCopy,
                                  clearUnsetFields: false,
                                ),
                              );
                              await widget.sessioDoc!.reference
                                  .update(treeniSessiotUpdateData);
                            }

                            setState(() {});
                          },
                          child: ListTile(
                            title: Text(
                              FFLocalizations.of(context).getText(
                                '1ejk01eg' /* Liitä yläpuolelle */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_up_rounded,
                              color: Color(0xFF303030),
                              size: 30.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_SHEET_LIIKE_Container_zqyhzhyk_ON');
                          logFirebaseEvent(
                              'Container_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          if (widget.sessioDoc != null) {
                            logFirebaseEvent('Container_custom_action');
                            _model.updatedRutiiniCopyCopy =
                                await actions.myUpdateTreeniRutiiniStruct(
                              widget.sessioDoc!.treeniRutiiniData,
                              null,
                              null,
                              widget.sessioDoc!.treeniRutiiniData.liikkeet
                                  ?.toList()
                                  ?.toList(),
                              null,
                              null,
                              null,
                              null,
                              null,
                              null,
                              widget.liikeIndex,
                              null,
                              null,
                              null,
                              null,
                              widget.liikeIndex,
                              FFAppState().kopioidutLiikkeet.toList(),
                              false,
                              true,
                            );
                            logFirebaseEvent('Container_backend_call');

                            final treeniSessiotUpdateData =
                                createTreeniSessiotRecordData(
                              treeniRutiiniData: updateTreeniRutiiniStruct(
                                _model.updatedRutiiniCopy,
                                clearUnsetFields: false,
                              ),
                            );
                            await widget.sessioDoc!.reference
                                .update(treeniSessiotUpdateData);
                          }

                          setState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 300.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'n87lfy7j' /* Liitä alapuolelle */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xFF303030),
                              size: 30.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 300.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  onLongPress: () async {
                    logFirebaseEvent(
                        'BOTTOM_SHEET_LIIKE_ListTile_uaqv3mkg_ON_');
                    logFirebaseEvent('ListTile_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                    if (widget.sessioDoc != null) {
                      logFirebaseEvent('ListTile_custom_action');
                      _model.updatedRutiini =
                          await actions.myUpdateTreeniRutiiniStruct(
                        widget.sessioDoc!.treeniRutiiniData,
                        null,
                        null,
                        widget.sessioDoc!.treeniRutiiniData.liikkeet
                            ?.toList()
                            ?.toList(),
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        widget.liikeIndex,
                        null,
                        null,
                        null,
                        null,
                        widget.liikeIndex,
                        functions.emptyJsonList()?.toList(),
                        null,
                        null,
                      );
                      logFirebaseEvent('ListTile_backend_call');

                      final treeniSessiotUpdateData =
                          createTreeniSessiotRecordData(
                        treeniRutiiniData: updateTreeniRutiiniStruct(
                          _model.updatedRutiini,
                          clearUnsetFields: false,
                        ),
                      );
                      await widget.sessioDoc!.reference
                          .update(treeniSessiotUpdateData);
                    }

                    setState(() {});
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'c8ldb00c' /* Poista liike */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFFE00000),
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'ha2mfouu' /* (Paina pitkään) */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: Color(0xFF303030),
                      size: 30.0,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_rutiini_ja_sessio_model.dart';
export 'bottom_sheet_rutiini_ja_sessio_model.dart';

class BottomSheetRutiiniJaSessioWidget extends StatefulWidget {
  const BottomSheetRutiiniJaSessioWidget({
    Key? key,
    this.rutiiniData,
    this.treeniSessioDoc,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiiniData;
  final TreeniSessiotRecord? treeniSessioDoc;

  @override
  _BottomSheetRutiiniJaSessioWidgetState createState() =>
      _BottomSheetRutiiniJaSessioWidgetState();
}

class _BottomSheetRutiiniJaSessioWidgetState
    extends State<BottomSheetRutiiniJaSessioWidget> {
  late BottomSheetRutiiniJaSessioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetRutiiniJaSessioModel());

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
              if (valueOrDefault<bool>(
                widget.rutiiniData!.liikkeet!.toList().length > 0,
                false,
              ))
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
                            'BOTTOM_SHEET_RUTIINI_JA_SESSIO_ListTile_');
                        logFirebaseEvent('ListTile_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                        logFirebaseEvent('ListTile_show_snack_bar');
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              FFLocalizations.of(context).getVariableText(
                                fiText: '🙁 Tämä toiminto ei toimi vielä...',
                                enText: '🙁This function doesn\'t work yet',
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFFE00000),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          FFLocalizations.of(context).getText(
                            'elbafojn' /* Kopioi liikkeet */,
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
                          'BOTTOM_SHEET_RUTIINI_JA_SESSIO_ListTile_');
                      if (widget.treeniSessioDoc != null) {
                        logFirebaseEvent('ListTile_backend_call');
                        await widget.treeniSessioDoc!.reference.delete();
                      } else {
                        logFirebaseEvent('ListTile_custom_action');
                        await actions.updateUserDocTreenirutiini(
                          widget.rutiiniData,
                          null,
                          null,
                          false,
                          null,
                          null,
                          null,
                          null,
                          widget.rutiiniData?.liikkeet?.toList()?.toList(),
                          null,
                          null,
                          null,
                          true,
                          true,
                          null,
                          false,
                        );
                      }

                      logFirebaseEvent('ListTile_close_dialog,_drawer,_etc');
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(
                        FFLocalizations.of(context).getText(
                          'e0l254zt' /* Muokkaa */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      trailing: Icon(
                        Icons.edit_rounded,
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
                        'BOTTOM_SHEET_RUTIINI_JA_SESSIO_ListTile_');
                    if (widget.treeniSessioDoc != null) {
                      logFirebaseEvent('ListTile_backend_call');
                      await widget.treeniSessioDoc!.reference.delete();
                    } else {
                      logFirebaseEvent('ListTile_custom_action');
                      await actions.updateUserDocTreenirutiini(
                        widget.rutiiniData,
                        null,
                        null,
                        false,
                        null,
                        null,
                        null,
                        null,
                        widget.rutiiniData?.liikkeet?.toList()?.toList(),
                        null,
                        null,
                        null,
                        null,
                        true,
                        true,
                        false,
                      );
                    }

                    logFirebaseEvent('ListTile_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'esn5dhxf' /* Poista pysyvästi */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFFE00000),
                          ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '2a9bmoed' /* (Paina pitkään) */,
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

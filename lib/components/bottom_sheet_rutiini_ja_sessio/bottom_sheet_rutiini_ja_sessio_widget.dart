import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                    if (widget.treeniSessioDoc != null) {
                      await widget.treeniSessioDoc!.reference.delete();
                    } else {
                      final usersUpdateData = {
                        'treeniRutiinit': FieldValue.arrayRemove([
                          getTreeniRutiiniFirestoreData(
                            updateTreeniRutiiniStruct(
                              widget.rutiiniData,
                              clearUnsetFields: false,
                            ),
                            true,
                          )
                        ]),
                      };
                      await currentUserReference!.update(usersUpdateData);
                    }

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
                        'z89yi85w' /* (paina pitkään) */,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                    Navigator.pop(context);
                    if (widget.treeniSessioDoc != null) {
                      FFAppState().valittuTreenattavaHistorianSessioRef =
                          widget.treeniSessioDoc!.reference;
                    } else {
                      _model.rutiiniDataJson =
                          await actions.jsonRutiiniFromDataStruct(
                        widget.rutiiniData,
                      );
                      FFAppState().valittuTreenattavaTreeniRutiini =
                          _model.rutiiniDataJson!;
                    }

                    FFAppState().update(() {
                      FFAppState().showTreenaaSivu = true;
                      FFAppState().isEditing = true;
                    });

                    setState(() {});
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
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
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
      ),
    );
  }
}

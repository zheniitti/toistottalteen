import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_rutiini_model.dart';
export 'bottom_sheet_rutiini_model.dart';

class BottomSheetRutiiniWidget extends StatefulWidget {
  const BottomSheetRutiiniWidget({
    Key? key,
    this.rutiininNimi,
  }) : super(key: key);

  final String? rutiininNimi;

  @override
  _BottomSheetRutiiniWidgetState createState() =>
      _BottomSheetRutiiniWidgetState();
}

class _BottomSheetRutiiniWidgetState extends State<BottomSheetRutiiniWidget> {
  late BottomSheetRutiiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetRutiiniModel());

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
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text(FFLocalizations.of(context).getVariableText(
                          fiText: 'Poista rutiini',
                          enText: 'Delete routine',
                        )),
                        content:
                            Text(FFLocalizations.of(context).getVariableText(
                          fiText: 'Haluatko varmasti poistaa rutiinin?',
                          enText:
                              'Are you sure you want to delete the routine?',
                        )),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text(
                                FFLocalizations.of(context).getVariableText(
                              fiText: 'Poista',
                              enText: 'Delete',
                            )),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'e0l254zt' /* Poista rutiini */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title3,
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
    );
  }
}

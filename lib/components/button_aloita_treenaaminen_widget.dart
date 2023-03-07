import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_aloita_treenaaminen_model.dart';
export 'button_aloita_treenaaminen_model.dart';

class ButtonAloitaTreenaaminenWidget extends StatefulWidget {
  const ButtonAloitaTreenaaminenWidget({
    Key? key,
    this.userAppData,
  }) : super(key: key);

  final AppDataRecord? userAppData;

  @override
  _ButtonAloitaTreenaaminenWidgetState createState() =>
      _ButtonAloitaTreenaaminenWidgetState();
}

class _ButtonAloitaTreenaaminenWidgetState
    extends State<ButtonAloitaTreenaaminenWidget> {
  late ButtonAloitaTreenaaminenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonAloitaTreenaaminenModel());

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

    return FFButtonWidget(
      onPressed: () async {
        context.pushNamed(
          'treenaaminen_sivu',
          queryParams: {
            'userAppData': serializeParam(
              widget.userAppData,
              ParamType.Document,
            ),
            'rutiininNimi': serializeParam(
              null,
              ParamType.String,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'userAppData': widget.userAppData,
          },
        );
      },
      text: FFLocalizations.of(context).getText(
        'wmqwog4s' /* Aloita treenaaminen */,
      ),
      options: FFButtonOptions(
        width: 240.0,
        height: 70.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle1.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 2.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}

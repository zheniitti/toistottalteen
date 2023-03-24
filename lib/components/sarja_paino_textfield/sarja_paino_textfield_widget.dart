import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sarja_paino_textfield_model.dart';
export 'sarja_paino_textfield_model.dart';

class SarjaPainoTextfieldWidget extends StatefulWidget {
  const SarjaPainoTextfieldWidget({
    Key? key,
    this.sarjaIndex,
    this.sarja,
    this.liikeIndex,
    this.sessioDoc,
  }) : super(key: key);

  final int? sarjaIndex;
  final SarjaStruct? sarja;
  final int? liikeIndex;
  final TreeniSessiotRecord? sessioDoc;

  @override
  _SarjaPainoTextfieldWidgetState createState() =>
      _SarjaPainoTextfieldWidgetState();
}

class _SarjaPainoTextfieldWidgetState extends State<SarjaPainoTextfieldWidget> {
  late SarjaPainoTextfieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SarjaPainoTextfieldModel());

    _model.textController ??=
        TextEditingController(text: widget.sarja?.paino?.toString());
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

    return TextFormField(
      controller: _model.textController,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.textController',
        Duration(milliseconds: 300),
        () => setState(() {}),
      ),
      obscureText: false,
      decoration: InputDecoration(
        hintText: FFLocalizations.of(context).getText(
          'vd95k1b9' /* 0 */,
        ),
        hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Roboto',
              fontSize: 20.0,
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: FlutterFlowTheme.of(context).title3,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

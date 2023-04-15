import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_liike_nimi_textfield_model.dart';
export 'rutiinin_liike_nimi_textfield_model.dart';

class RutiininLiikeNimiTextfieldWidget extends StatefulWidget {
  const RutiininLiikeNimiTextfieldWidget({
    Key? key,
    this.rutiini,
    this.liikeIndex,
    this.liike,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final int? liikeIndex;
  final LiikeStruct? liike;

  @override
  _RutiininLiikeNimiTextfieldWidgetState createState() =>
      _RutiininLiikeNimiTextfieldWidgetState();
}

class _RutiininLiikeNimiTextfieldWidgetState
    extends State<RutiininLiikeNimiTextfieldWidget> {
  late RutiininLiikeNimiTextfieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiininLiikeNimiTextfieldModel());

    _model.textController ??= TextEditingController(text: widget.liike?.nimi);
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
        Duration(milliseconds: 200),
        () async {
          logFirebaseEvent('RUTIININ_LIIKE_NIMI_TEXTFIELD_TextField_');
          logFirebaseEvent('TextField_custom_action');
          await actions.updateUserDocLiikeAtIndex(
            valueOrDefault<int>(
              widget.liikeIndex,
              999999999999,
            ),
            widget.rutiini,
            _model.textController.text,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
          );
        },
      ),
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: FFLocalizations.of(context).getText(
          '6g69qd7e' /* Treenilikkeen nimi */,
        ),
        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Roboto',
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
      ),
      style: FlutterFlowTheme.of(context).titleSmall.override(
            fontFamily: 'Roboto',
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
      textAlign: TextAlign.start,
      maxLines: null,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

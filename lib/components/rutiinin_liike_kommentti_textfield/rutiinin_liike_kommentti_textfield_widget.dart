import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_liike_kommentti_textfield_model.dart';
export 'rutiinin_liike_kommentti_textfield_model.dart';

class RutiininLiikeKommenttiTextfieldWidget extends StatefulWidget {
  const RutiininLiikeKommenttiTextfieldWidget({
    Key? key,
    this.rutiini,
    this.liikeIndex,
    this.liike,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;
  final int? liikeIndex;
  final LiikeStruct? liike;

  @override
  _RutiininLiikeKommenttiTextfieldWidgetState createState() =>
      _RutiininLiikeKommenttiTextfieldWidgetState();
}

class _RutiininLiikeKommenttiTextfieldWidgetState
    extends State<RutiininLiikeKommenttiTextfieldWidget> {
  late RutiininLiikeKommenttiTextfieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiininLiikeKommenttiTextfieldModel());

    _model.textController ??=
        TextEditingController(text: widget.liike?.kommentti);
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
          logFirebaseEvent('RUTIININ_LIIKE_KOMMENTTI_TEXTFIELD_TextF');
          logFirebaseEvent('TextField_custom_action');
          await actions.updateUserDocLiikeAtIndex(
            widget.liikeIndex!,
            widget.rutiini,
            null,
            _model.textController.text,
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
          'jc8zfh0n' /* Kommentti 💬 */,
        ),
        hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
              fontFamily: 'Roboto',
              fontSize: 14.0,
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
      style: FlutterFlowTheme.of(context).bodyText1.override(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
          ),
      textAlign: TextAlign.start,
      maxLines: null,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

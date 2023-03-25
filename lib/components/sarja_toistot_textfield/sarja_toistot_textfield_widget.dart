import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'sarja_toistot_textfield_model.dart';
export 'sarja_toistot_textfield_model.dart';

class SarjaToistotTextfieldWidget extends StatefulWidget {
  const SarjaToistotTextfieldWidget({
    Key? key,
    this.sarjaIndex,
    this.sarja,
    this.sessioDoc,
    this.liikeIndex,
  }) : super(key: key);

  final int? sarjaIndex;
  final SarjaStruct? sarja;
  final TreeniSessiotRecord? sessioDoc;
  final int? liikeIndex;

  @override
  _SarjaToistotTextfieldWidgetState createState() =>
      _SarjaToistotTextfieldWidgetState();
}

class _SarjaToistotTextfieldWidgetState
    extends State<SarjaToistotTextfieldWidget> {
  late SarjaToistotTextfieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SarjaToistotTextfieldModel());

    _model.textController ??=
        TextEditingController(text: widget.sarja?.toistoMaara?.toString());
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
        () async {
          logFirebaseEvent('SARJA_TOISTOT_TEXTFIELD_TextField_hybg73');
          logFirebaseEvent('TextField_custom_action');
          _model.updatedSarja = await actions.myUpdateSarja(
            widget.sarja!,
            true,
            null,
            int.tryParse(_model.textController.text),
            null,
            null,
            null,
          );
          logFirebaseEvent('TextField_custom_action');
          _model.updatedLiike = await actions.myUpdateLiikeStruct(
            widget.sessioDoc!.treeniRutiiniData.liikkeet
                ?.toList()?[widget.liikeIndex??-1],
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            false,
            null,
            widget.sarjaIndex,
            _model.updatedSarja,
          );
          logFirebaseEvent('TextField_custom_action');
          _model.updatedRutiini = await actions.myUpdateTreeniRutiiniStruct(
            widget.sessioDoc!.treeniRutiiniData,
            null,
            null,
            widget.sessioDoc!.treeniRutiiniData.liikkeet?.toList()?.toList(),
            null,
            null,
            null,
            false,
            null,
            null,
            null,
            null,
            null,
            widget.liikeIndex,
            _model.updatedLiike,
          );
          logFirebaseEvent('TextField_backend_call');

          final treeniSessiotUpdateData = createTreeniSessiotRecordData(
            treeniRutiiniData: updateTreeniRutiiniStruct(
              _model.updatedRutiini,
              clearUnsetFields: false,
            ),
          );
          await widget.sessioDoc!.reference.update(treeniSessiotUpdateData);

          setState(() {});
        },
      ),
      obscureText: false,
      decoration: InputDecoration(
        hintText: FFLocalizations.of(context).getText(
          'yylnuo9q' /* 0 */,
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
      inputFormatters: [_model.textFieldMask],
    );
  }
}

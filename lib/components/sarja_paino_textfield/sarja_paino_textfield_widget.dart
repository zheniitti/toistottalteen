import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
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

    _model.textController ??= TextEditingController();
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
          logFirebaseEvent('SARJA_PAINO_TEXTFIELD_TextField_jryelkzo');
          logFirebaseEvent('TextField_custom_action');
          _model.updatedSarja = await actions.myUpdateSarja(
            widget.sarja!,
            true,
            null,
            null,
            double.tryParse(_model.textController.text),
            null,
            null,
            null,
          );
          logFirebaseEvent('TextField_custom_action');
          _model.updatedLiike = await actions.myUpdateLiikeStruct(
            widget.sessioDoc!.treeniRutiiniData.liikkeet
                ?.toList()?[valueOrDefault<int>(
              widget.liikeIndex,
              99999999999,
            )],
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
            null,
            functions.emptyJsonList()?.toList(),
            false,
            false,
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
        isDense: true,
        hintText: widget.sarja?.paino?.toString(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).inactiveWidgetBackground,
      ),
      style: FlutterFlowTheme.of(context).headlineSmall,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

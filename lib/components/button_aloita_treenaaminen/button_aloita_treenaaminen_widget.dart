import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_aloita_treenaaminen_model.dart';
export 'button_aloita_treenaaminen_model.dart';

class ButtonAloitaTreenaaminenWidget extends StatefulWidget {
  const ButtonAloitaTreenaaminenWidget({Key? key}) : super(key: key);

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
        logFirebaseEvent('BUTTON_ALOITA_TREENAAMINEN_ALOITA_TREENA');
        logFirebaseEvent('Button_backend_call');

        final treeniSessiotCreateData = {
          ...createTreeniSessiotRecordData(
            userRef: currentUserReference,
            treeniRutiiniData: createTreeniRutiiniStruct(
              isTreeniPohja: false,
              fieldValues: {
                'createdTime': FieldValue.serverTimestamp(),
              },
              clearUnsetFields: false,
              create: true,
            ),
          ),
          'docCreatedTime': FieldValue.serverTimestamp(),
        };
        var treeniSessiotRecordReference = TreeniSessiotRecord.collection.doc();
        await treeniSessiotRecordReference.set(treeniSessiotCreateData);
        _model.uusiTreeniSessio = TreeniSessiotRecord.getDocumentFromData(
            treeniSessiotCreateData, treeniSessiotRecordReference);
        logFirebaseEvent('Button_custom_action');
        _model.jsonRutiini = await actions.rutiiniToJsonFirestoreData(
          _model.uusiTreeniSessio!.treeniRutiiniData,
        );
        logFirebaseEvent('Button_update_app_state');
        FFAppState().update(() {
          FFAppState().valittuTreenattavaHistorianSessioRef =
              _model.uusiTreeniSessio!.reference;
          FFAppState().valittuTreenattavaTreeniRutiini = _model.jsonRutiini!;
          FFAppState().isEditing = false;
        });

        setState(() {});
      },
      text: FFLocalizations.of(context).getText(
        'wmqwog4s' /* Aloita treenaaminen */,
      ),
      options: FFButtonOptions(
        width: 240.0,
        height: 70.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).tertiaryColor,
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

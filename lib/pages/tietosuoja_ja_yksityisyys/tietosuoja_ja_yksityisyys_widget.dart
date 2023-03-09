import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tietosuoja_ja_yksityisyys_model.dart';
export 'tietosuoja_ja_yksityisyys_model.dart';

class TietosuojaJaYksityisyysWidget extends StatefulWidget {
  const TietosuojaJaYksityisyysWidget({Key? key}) : super(key: key);

  @override
  _TietosuojaJaYksityisyysWidgetState createState() =>
      _TietosuojaJaYksityisyysWidgetState();
}

class _TietosuojaJaYksityisyysWidgetState
    extends State<TietosuojaJaYksityisyysWidget> {
  late TietosuojaJaYksityisyysModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TietosuojaJaYksityisyysModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'tietosuojaJaYksityisyys'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}

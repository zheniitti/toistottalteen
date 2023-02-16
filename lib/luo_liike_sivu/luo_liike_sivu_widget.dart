import '../components/treeni_liike_form_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'luo_liike_sivu_model.dart';
export 'luo_liike_sivu_model.dart';

class LuoLiikeSivuWidget extends StatefulWidget {
  const LuoLiikeSivuWidget({Key? key}) : super(key: key);

  @override
  _LuoLiikeSivuWidgetState createState() => _LuoLiikeSivuWidgetState();
}

class _LuoLiikeSivuWidgetState extends State<LuoLiikeSivuWidget> {
  late LuoLiikeSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LuoLiikeSivuModel());
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'kf3zbmmg' /* Treeniliikkeen luominen */,
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: wrapWithModel(
                  model: _model.treeniLiikeFormModel,
                  updateCallback: () => setState(() {}),
                  child: TreeniLiikeFormWidget(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

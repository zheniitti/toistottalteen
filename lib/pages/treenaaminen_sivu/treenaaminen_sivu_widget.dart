import '/components/treenaa_sivu/treenaa_sivu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treenaaminen_sivu_model.dart';
export 'treenaaminen_sivu_model.dart';

class TreenaaminenSivuWidget extends StatefulWidget {
  const TreenaaminenSivuWidget({
    Key? key,
    this.rutiininNimi,
  }) : super(key: key);

  final String? rutiininNimi;

  @override
  _TreenaaminenSivuWidgetState createState() => _TreenaaminenSivuWidgetState();
}

class _TreenaaminenSivuWidgetState extends State<TreenaaminenSivuWidget> {
  late TreenaaminenSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreenaaminenSivuModel());

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
          child: wrapWithModel(
            model: _model.treenaaSivuModel,
            updateCallback: () => setState(() {}),
            child: TreenaaSivuWidget(
              sessioRef: null,
              rutiinipohja: null,
            ),
          ),
        ),
      ),
    );
  }
}

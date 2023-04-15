import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'webview1_model.dart';
export 'webview1_model.dart';

class Webview1Widget extends StatefulWidget {
  const Webview1Widget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  _Webview1WidgetState createState() => _Webview1WidgetState();
}

class _Webview1WidgetState extends State<Webview1Widget> {
  late Webview1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Webview1Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Webview1'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: FlutterFlowWebView(
            url: widget.url!,
            bypass: true,
            height: MediaQuery.of(context).size.height * 1.0,
            verticalScroll: true,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}

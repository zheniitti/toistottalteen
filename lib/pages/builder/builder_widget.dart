import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'builder_model.dart';
export 'builder_model.dart';

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  _BuilderWidgetState createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {
  late BuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuilderModel());

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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'v1rlq3l4' /* Page Title */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'nvbc1cqj' /* Hello World */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              wrapWithModel(
                model: _model.bottomSheetRutiiniJaSessioModel,
                updateCallback: () => setState(() {}),
                child: BottomSheetRutiiniJaSessioWidget(
                  rutiiniData: null,
                  treeniSessioDoc: null,
                ),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

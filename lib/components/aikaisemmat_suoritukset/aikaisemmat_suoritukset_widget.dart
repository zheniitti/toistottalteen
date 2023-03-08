import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aikaisemmat_suoritukset_model.dart';
export 'aikaisemmat_suoritukset_model.dart';

class AikaisemmatSuorituksetWidget extends StatefulWidget {
  const AikaisemmatSuorituksetWidget({Key? key}) : super(key: key);

  @override
  _AikaisemmatSuorituksetWidgetState createState() =>
      _AikaisemmatSuorituksetWidgetState();
}

class _AikaisemmatSuorituksetWidgetState
    extends State<AikaisemmatSuorituksetWidget> {
  late AikaisemmatSuorituksetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AikaisemmatSuorituksetModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Divider(
          thickness: 1.0,
        ),
        Container(
          decoration: BoxDecoration(),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: ExpandableNotifier(
              initialExpanded: false,
              child: ExpandablePanel(
                header: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'nuyg0kz2' /* Heatmap kalenteri */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ],
                ),
                collapsed: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 0.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                expanded: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '42oknvjl' /* Heat map */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: false,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

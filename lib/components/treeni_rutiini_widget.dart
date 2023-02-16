import '../backend/backend.dart';
import '../components/rutiini_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'treeni_rutiini_model.dart';
export 'treeni_rutiini_model.dart';

class TreeniRutiiniWidget extends StatefulWidget {
  const TreeniRutiiniWidget({
    Key? key,
    this.treeniRutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? treeniRutiini;

  @override
  _TreeniRutiiniWidgetState createState() => _TreeniRutiiniWidgetState();
}

class _TreeniRutiiniWidgetState extends State<TreeniRutiiniWidget> {
  late TreeniRutiiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreeniRutiiniModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: double.infinity,
        color: Color(0x00FFFFFF),
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 6, 0, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.treeniRutiini!.nimi!,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  Text(
                    '${FFLocalizations.of(context).getVariableText(
                      fiText: 'Treenattu: ',
                      enText: 'Last session:',
                    )}4pv sitten',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ],
              ),
            ),
            collapsed: Container(
              width: MediaQuery.of(context).size.width,
              height: 0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            expanded: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      FFLocalizations.of(context).getVariableText(
                        fiText:
                            'Rutiinin kommentti: ${widget.treeniRutiini?.kommentti}',
                        enText:
                            'Routine comment: ${widget.treeniRutiini?.kommentti}',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.rutiiniModel1,
                    updateCallback: () => setState(() {}),
                    child: RutiiniWidget(
                      rutiini: widget.treeniRutiini,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        thickness: 1,
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
                                      '0m4il322' /* Heatmap kalenteri */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                              collapsed: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowCalendar(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    weekFormat: false,
                                    weekStartsMonday: true,
                                    initialDate: getCurrentTimestamp,
                                    onChange: (DateTimeRange? newSelectedDate) {
                                      setState(() =>
                                          _model.calendarSelectedDay =
                                              newSelectedDate);
                                    },
                                    titleStyle: TextStyle(),
                                    dayOfWeekStyle: TextStyle(),
                                    dateStyle: TextStyle(),
                                    selectedDateStyle: TextStyle(),
                                    inactiveDateStyle: TextStyle(),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  wrapWithModel(
                                    model: _model.rutiiniModel2,
                                    updateCallback: () => setState(() {}),
                                    child: RutiiniWidget(
                                      rutiini: widget.treeniRutiini,
                                    ),
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: _model.checkboxListTileValue ??= false,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue = newValue!);
                            },
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                'r1v3hyro' /* Ota pohjaksi valitun päivän tr... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 10,
                                  ),
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'hn9k2t8e' /* Treenaa */,
                          ),
                          options: FFButtonOptions(
                            width: 100,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
          ),
        ),
      ),
    );
  }
}

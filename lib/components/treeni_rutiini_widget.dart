import '/backend/backend.dart';
import '/components/liikkeet_widget.dart';
import '/components/poista_rutiini_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
    this.treeniSessio,
  }) : super(key: key);

  final TreeniRutiiniStruct? treeniRutiini;
  final TreeniSessiotRecord? treeniSessio;

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

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        color: Color(0x00FFFFFF),
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 0.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.treeniRutiini!.nimi!,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        if (widget.treeniRutiini != null)
                          Text(
                            '${FFLocalizations.of(context).getVariableText(
                              fiText: 'Treenattu: ',
                              enText: 'Last session:',
                            )}4pv sitten',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        if (widget.treeniSessio != null)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 2.0,
                              alignment: WrapAlignment.spaceAround,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '5hsnij9t' /* 18:05 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'dm2kbqw6' /* 1H 25min */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '452cnmn6' /* 5 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 8.0, 0.0),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: PoistaRutiiniBottomSheetWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
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
            expanded: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getVariableText(
                        fiText: 'Kommentti: ${widget.treeniRutiini?.kommentti}',
                        enText: 'Comment: ${widget.treeniRutiini?.kommentti}',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.rutiininLiikkeetModel,
                    updateCallback: () => setState(() {}),
                    child: LiikkeetWidget(
                      rutiini: widget.treeniRutiini,
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  if (false)
                    Wrap(
                      spacing: 0.0,
                      runSpacing: 12.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 180.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                      fontSize: 10.0,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('treenaaminen_sivu');
                            },
                            text: FFLocalizations.of(context).getText(
                              'hn9k2t8e' /* Suorita */,
                            ),
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: false,
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('treenaaminen_sivu');
                            },
                            text: FFLocalizations.of(context).getText(
                              'zg2n2e21' /* Treenihistoria */,
                            ),
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('treenaaminen_sivu');
                            },
                            text: FFLocalizations.of(context).getText(
                              'h16b2vng' /* Suorita nyt */,
                            ),
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
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

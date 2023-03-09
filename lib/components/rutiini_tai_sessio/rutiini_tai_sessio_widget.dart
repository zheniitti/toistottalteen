import '/backend/backend.dart';
import '/components/bottom_sheet_rutiini_ja_sessio/bottom_sheet_rutiini_ja_sessio_widget.dart';
import '/components/liikkeet/liikkeet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiini_tai_sessio_model.dart';
export 'rutiini_tai_sessio_model.dart';

class RutiiniTaiSessioWidget extends StatefulWidget {
  const RutiiniTaiSessioWidget({
    Key? key,
    this.treeniRutiini,
    this.treeniSessio,
  }) : super(key: key);

  final TreeniRutiiniStruct? treeniRutiini;
  final TreeniSessiotRecord? treeniSessio;

  @override
  _RutiiniTaiSessioWidgetState createState() => _RutiiniTaiSessioWidgetState();
}

class _RutiiniTaiSessioWidgetState extends State<RutiiniTaiSessioWidget> {
  late RutiiniTaiSessioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiiniTaiSessioModel());

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
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        color: Color(0x00FFFFFF),
        child: ExpandableNotifier(
          initialExpanded: true,
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
                                      dateTimeFormat(
                                        'Hm',
                                        widget.treeniSessio!.alku!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
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
                                      valueOrDefault<String>(
                                        widget.treeniSessio!.treeniRutiiniData
                                            .liikkeet
                                            ?.toList()
                                            ?.length
                                            ?.toString(),
                                        '0',
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
                            child: BottomSheetRutiiniJaSessioWidget(
                              rutiiniData: widget.treeniRutiini,
                              treeniSessioDoc: widget.treeniSessio,
                            ),
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
                  Divider(
                    thickness: 1.0,
                  ),
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
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: true,
                      child: Wrap(
                        spacing: 30.0,
                        runSpacing: 12.0,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'zg2n2e21' /* Rutiinihistoria */,
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
                              _model.rutiiniJson =
                                  await actions.jsonRutiiniFromDataStruct(
                                widget.treeniRutiini,
                              );
                              FFAppState().update(() {
                                FFAppState().valittuTreenattavaTreeniRutiini =
                                    _model.rutiiniJson!;
                                FFAppState().navBarIndex = 1;
                              });

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'h16b2vng' /* Treenaa nyt */,
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

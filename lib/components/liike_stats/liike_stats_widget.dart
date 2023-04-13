import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liike_stats_model.dart';
export 'liike_stats_model.dart';

class LiikeStatsWidget extends StatefulWidget {
  const LiikeStatsWidget({
    Key? key,
    this.sessioDocs,
  }) : super(key: key);

  final List<TreeniSessiotRecord>? sessioDocs;

  @override
  _LiikeStatsWidgetState createState() => _LiikeStatsWidgetState();
}

class _LiikeStatsWidgetState extends State<LiikeStatsWidget> {
  late LiikeStatsModel _model;

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiikeStatsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIIKE_STATS_LiikeStats_ON_INIT_STATE');
      logFirebaseEvent('LiikeStats_update_widget_state');
      _model.liikeNamesList = functions
          .allLiikeNamesFromSessioDocs(widget.sessioDocs?.toList())
          .toList();
    });

    _model.textController ??= TextEditingController();
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
        Expanded(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                PageView(
                  controller: _model.pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'dyrq0frb' /* Painon  ja toiston korrelaatio */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                          child: Container(
                            width: double.infinity,
                            height: 266.0,
                            child: FlutterFlowLineChart(
                              data: [
                                FFLineChartData(
                                  xData: _model.weightNumbersList,
                                  yData: _model.repsNumbersList,
                                  settings: LineChartBarData(
                                    color: Color(0xFFD354E3),
                                    barWidth: 1.0,
                                    isCurved: true,
                                    preventCurveOverShooting: true,
                                  ),
                                )
                              ],
                              chartStylingInfo: ChartStylingInfo(
                                backgroundColor: Color(0x00FFFFFF),
                                showGrid: true,
                                showBorder: false,
                              ),
                              axisBounds: AxisBounds(),
                              xAxisLabelInfo: AxisLabelInfo(
                                title: FFLocalizations.of(context).getText(
                                  '4ku6t0l0' /* Paino */,
                                ),
                                titleTextStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                showLabels: true,
                                labelInterval: 10.0,
                              ),
                              yAxisLabelInfo: AxisLabelInfo(
                                title: FFLocalizations.of(context).getText(
                                  'vrypgu4p' /* Toistot */,
                                ),
                                titleTextStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                showLabels: true,
                                labelInterval: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      'https://picsum.photos/seed/557/600',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://picsum.photos/seed/886/600',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 3,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      effect: smooth_page_indicator.ExpandingDotsEffect(
                        expansionFactor: 2.0,
                        spacing: 8.0,
                        radius: 16.0,
                        dotWidth: 16.0,
                        dotHeight: 8.0,
                        dotColor: FlutterFlowTheme.of(context).accent2,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 300.0,
          child: Autocomplete<String>(
            initialValue: TextEditingValue(),
            optionsBuilder: (textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _model.liikeNamesList.toList().where((option) {
                final lowercaseOption = option.toLowerCase();
                return lowercaseOption
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            optionsViewBuilder: (context, onSelected, options) {
              return AutocompleteOptionsList(
                textFieldKey: _model.textFieldKey,
                textController: _model.textController!,
                options: options.toList(),
                onSelected: onSelected,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                textHighlightStyle: TextStyle(),
                elevation: 4.0,
                optionBackgroundColor:
                    FlutterFlowTheme.of(context).primaryBackground,
                optionHighlightColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                maxHeight: 200.0,
              );
            },
            onSelected: (String selection) {
              setState(() => _model.textFieldSelectedOption = selection);
              FocusScope.of(context).unfocus();
            },
            fieldViewBuilder: (
              context,
              textEditingController,
              focusNode,
              onEditingComplete,
            ) {
              _model.textController = textEditingController;
              return TextFormField(
                key: _model.textFieldKey,
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 800),
                  () async {
                    logFirebaseEvent(
                        'LIIKE_STATS_TextField_hrnsfk7v_ON_TEXTFI');
                    logFirebaseEvent('TextField_update_widget_state');
                    setState(() {
                      _model.weightNumbersList = getJsonField(
                        functions.singleLiikeStats(_model.textController.text,
                            widget.sessioDocs?.toList()),
                        r'''$.weight_numberList''',
                      )!
                          .toList();
                      _model.repsNumbersList = getJsonField(
                        functions.singleLiikeStats(_model.textController.text,
                            widget.sessioDocs?.toList()),
                        r'''$.reps_numberList''',
                      )!
                          .toList();
                    });
                  },
                ),
                onFieldSubmitted: (_) async {
                  logFirebaseEvent('LIIKE_STATS_TextField_hrnsfk7v_ON_TEXTFI');
                  logFirebaseEvent('TextField_update_widget_state');
                  setState(() {
                    _model.weightNumbersList = getJsonField(
                      functions.singleLiikeStats(_model.textController.text,
                          widget.sessioDocs?.toList()),
                      r'''$.weight_numberList''',
                    )!
                        .toList();
                    _model.repsNumbersList = getJsonField(
                      functions.singleLiikeStats(_model.textController.text,
                          widget.sessioDocs?.toList()),
                      r'''$.reps_numberList''',
                    )!
                        .toList();
                  });
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: FFLocalizations.of(context).getText(
                    'h9i7gu0b' /* Liikkeen nimi */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  suffixIcon: _model.textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.textController?.clear();
                            logFirebaseEvent(
                                'LIIKE_STATS_TextField_hrnsfk7v_ON_TEXTFI');
                            logFirebaseEvent('TextField_update_widget_state');
                            setState(() {
                              _model.weightNumbersList = getJsonField(
                                functions.singleLiikeStats(
                                    _model.textController.text,
                                    widget.sessioDocs?.toList()),
                                r'''$.weight_numberList''',
                              )!
                                  .toList();
                              _model.repsNumbersList = getJsonField(
                                functions.singleLiikeStats(
                                    _model.textController.text,
                                    widget.sessioDocs?.toList()),
                                r'''$.reps_numberList''',
                              )!
                                  .toList();
                            });
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            size: 24.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              );
            },
          ),
        ),
      ],
    );
  }
}

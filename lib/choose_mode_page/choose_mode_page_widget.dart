import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../register_or_sign_in_page/register_or_sign_in_page_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_mode_page_model.dart';
export 'choose_mode_page_model.dart';

class ChooseModePageWidget extends StatefulWidget {
  const ChooseModePageWidget({Key? key}) : super(key: key);

  @override
  _ChooseModePageWidgetState createState() => _ChooseModePageWidgetState();
}

class _ChooseModePageWidgetState extends State<ChooseModePageWidget>
    with TickerProviderStateMixin {
  late ChooseModePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseModePageModel());
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
          child: Stack(
            children: [
              Image.asset(
                'assets/images/man_pull_up_black_and_whitepng.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'hnae47eh' /* Choose Mode */,
                                ),
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).dadada,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(78, 0, 78, 68),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Stack(
                                        alignment: AlignmentDirectional(
                                            0, 0.44999999999999996),
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.1, 1.18),
                                            child: Container(
                                              width: 36,
                                              height: 36,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0xFF42C83C),
                                                    offset: Offset(0, -20),
                                                    spreadRadius: 10,
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 17),
                                            child: Container(
                                              width: 73,
                                              height: 73,
                                              decoration: BoxDecoration(
                                                color: Color(0x02FFFFFF),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 1),
                                                child: ClipOval(
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 87,
                                                      sigmaY: 87,
                                                    ),
                                                    child: Container(
                                                      width: 36,
                                                      height: 36,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/images/moon.svg',
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ciwoj06f' /* Dark Mode */,
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        color:
                                            FlutterFlowTheme.of(context).dadada,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation1']!),
                                Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 17),
                                      child: Container(
                                        width: 73,
                                        height: 73,
                                        decoration: BoxDecoration(
                                          color: Color(0x02FFFFFF),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 1),
                                          child: ClipOval(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 87,
                                                sigmaY: 87,
                                              ),
                                              child: Container(
                                                width: 36,
                                                height: 36,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/images/sun.svg',
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'tsdjgnki' /* Light Mode */,
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        color:
                                            FlutterFlowTheme.of(context).dadada,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation2']!),
                              ],
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: RegisterOrSignInPageWidget(),
                                ),
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '19i0uv3v' /* Jatka */,
                            ),
                            options: FFButtonOptions(
                              width: 300,
                              height: 80,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: TextStyle(
                                fontFamily: 'Satoshi',
                                color: FlutterFlowTheme.of(context).f6f6f6,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            showLoadingIndicator: false,
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation']!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

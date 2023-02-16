import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_pageeee/main_pageeee_widget.dart';
import '../sign_in_page/sign_in_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_page_model.dart';
export 'register_page_model.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key? key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget>
    with TickerProviderStateMixin {
  late RegisterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 15),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(0, 15),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 600.ms,
          begin: Offset(0, 15),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
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
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
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
    _model = createModel(context, () => RegisterPageModel());

    _model.textController1 = TextEditingController();
    _model.textController2 = TextEditingController();
    _model.textController3 = TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 30, 30, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, -1),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/images/left.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                      SvgPicture.asset(
                        'assets/images/spotify.svg',
                        width: 108,
                        height: 33,
                        fit: BoxFit.scaleDown,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                      Container(
                        width: 32,
                        height: 32,
                        constraints: BoxConstraints(
                          maxWidth: 0,
                          maxHeight: 0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 22),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gr1qvmg8' /* Register */,
                    ),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      color: FlutterFlowTheme.of(context).f2f2f2,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 38),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'yz8s4rx3' /* If You Need Any Support */,
                        ),
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).e1e1e1,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '1tyi7eol' /*  Click Here */,
                        ),
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation1']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 28, 16),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 79.9,
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 80,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0x23F6F6F6),
                          width: 1,
                        ),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 0, 5, 0),
                          child: TextFormField(
                            controller: _model.textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                's5vd6ez0' /* Full Name */,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Satoshi',
                                color: Color(0x9AA7A7A7),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).hintColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 28, 16),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 79.9,
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 80,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0x23F6F6F6),
                          width: 1,
                        ),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 0, 5, 0),
                          child: TextFormField(
                            controller: _model.textController2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'vbpktfla' /* Enter Email */,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Satoshi',
                                color: Color(0x9AA7A7A7),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).hintColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation3']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(28, 0, 28, 20),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                        maxHeight: 80,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0x23F6F6F6),
                          width: 1,
                        ),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(25, 0, 5, 0),
                          child: TextFormField(
                            controller: _model.textController3,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                'ppyczpj0' /* Password */,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Satoshi',
                                color: Color(0x99A7A7A7),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).hintColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation4']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 22),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3zlhwadj' /* Recovery Password */,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).aeaeae,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 21),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: MainPageeeeWidget(),
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'pbxocv0b' /* Create Account */,
                    ),
                    options: FFButtonOptions(
                      width: 329,
                      height: 92,
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(33, 0, 33, 51),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 146,
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).gradient1,
                                FlutterFlowTheme.of(context).gradient2
                              ],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '02ldsli7' /* Or */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).dcdcdc,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 146,
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).gradient2,
                                FlutterFlowTheme.of(context).gradient1
                              ],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation2']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(137, 0, 137, 57),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/google.svg',
                        width: 28,
                        height: 29,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/apple.svg',
                        width: 29,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation3']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 38),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'dd39k22d' /* Do You Have An Account ? */,
                        ),
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: FlutterFlowTheme.of(context).dbdbdb,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: SignInPageWidget(),
                            ),
                          );
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'f4aq41rb' /*  Sign In */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).blueColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['rowOnPageLoadAnimation4']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
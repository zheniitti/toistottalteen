import '/auth/firebase_auth/auth_util.dart';
import '/auth/firebase_auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/components/toistot_talteen_text/toistot_talteen_text_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'kirjaudu_sivu_model.dart';
export 'kirjaudu_sivu_model.dart';

class KirjauduSivuWidget extends StatefulWidget {
  const KirjauduSivuWidget({
    Key? key,
    int? initialIndex,
  })  : this.initialIndex = initialIndex ?? 0,
        super(key: key);

  final int initialIndex;

  @override
  _KirjauduSivuWidgetState createState() => _KirjauduSivuWidgetState();
}

class _KirjauduSivuWidgetState extends State<KirjauduSivuWidget> with TickerProviderStateMixin {
  late KirjauduSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
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
    'columnOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
    _model = createModel(context, () => KirjauduSivuModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'kirjaudu_sivu'});
    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
    _model.textfieldPhoneNumberController1 ??= TextEditingController();
    _model.emailAddressCreateAccController ??= TextEditingController();
    _model.passwordCreateAccController ??= TextEditingController();
    _model.passwordConfirmCreateAccController ??= TextEditingController();
    _model.textfieldPhoneNumberController2 ??= TextEditingController();

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
        backgroundColor: Color(0xFF14181B),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF14181B),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/woman_gym_black_and_white_.png',
                ).image,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent('KIRJAUDU_SIVU_PAGE_Icon_3wfhamup_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.toistotTalteenTextModel,
                            updateCallback: () => setState(() {}),
                            child: ToistotTalteenTextWidget(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        decoration: BoxDecoration(),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: min(
                              valueOrDefault<int>(
                                widget.initialIndex,
                                0,
                              ),
                              1),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.white,
                                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'faomx7ia' /* Kirjaudu */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'shz6a9m8' /* Luo tili */,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(20, 22, 20, 0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(context).getText(
                                                                  'ixt1bx4l' /* Kirjaudu seuraavilla vaihdoehd... */,
                                                                ),
                                                                textAlign: TextAlign.center,
                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                      fontFamily: 'Outfit',
                                                                      color: Color(0xC8FFFFFF),
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    logFirebaseEvent('KIRJAUDU_SIVU_Container_aw30qtra_ON_TAP');
                                                                    logFirebaseEvent('Container_auth');
                                                                    GoRouter.of(context).prepareAuthEvent();
                                                                    final user = await authManager.signInWithGoogle(context);
                                                                    if (user == null) {
                                                                      return;
                                                                    }
                                                                    if (loggedIn) {
                                                                      logFirebaseEvent('Container_backend_call');

                                                                      final usersUpdateData = createUsersRecordData(
                                                                        isAnonymous: false,
                                                                      );
                                                                      await currentUserReference!.update(usersUpdateData);
                                                                      logFirebaseEvent('Container_navigate_to');
                                                                      if (Navigator.of(context).canPop()) {
                                                                        context.pop();
                                                                      }
                                                                      context.pushNamedAuth('paasivu', mounted);
                                                                    }
                                                                  },
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3,
                                                                    shape: const CircleBorder(),
                                                                    child: Container(
                                                                      width: 60,
                                                                      height: 60,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF0F1113),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius: 5,
                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            offset: Offset(0, 2),
                                                                          )
                                                                        ],
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      alignment: AlignmentDirectional(0, 0),
                                                                      child: FaIcon(
                                                                        FontAwesomeIcons.google,
                                                                        color: Colors.white,
                                                                        size: 30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (isiOS)
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor: Colors.transparent,
                                                                    focusColor: Colors.transparent,
                                                                    hoverColor: Colors.transparent,
                                                                    highlightColor: Colors.transparent,
                                                                    onTap: () async {
                                                                      logFirebaseEvent('KIRJAUDU_SIVU_Container_7x64updo_ON_TAP');
                                                                      logFirebaseEvent('Container_auth');
                                                                      GoRouter.of(context).prepareAuthEvent();
                                                                      final user = await authManager.signInWithApple(context);
                                                                      if (user == null) {
                                                                        return;
                                                                      }
                                                                      if (loggedIn) {
                                                                        logFirebaseEvent('Container_backend_call');

                                                                        final usersUpdateData = createUsersRecordData(
                                                                          isAnonymous: false,
                                                                        );
                                                                        await currentUserReference!.update(usersUpdateData);
                                                                        logFirebaseEvent('Container_navigate_to');
                                                                        if (Navigator.of(context).canPop()) {
                                                                          context.pop();
                                                                        }
                                                                        context.pushNamedAuth('paasivu', mounted);
                                                                      }
                                                                    },
                                                                    child: Material(
                                                                      color: Colors.transparent,
                                                                      elevation: 3,
                                                                      shape: const CircleBorder(),
                                                                      child: Container(
                                                                        width: 60,
                                                                        height: 60,
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFF0F1113),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 5,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              offset: Offset(0, 2),
                                                                            )
                                                                          ],
                                                                          shape: BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(0, 0),
                                                                        child: FaIcon(
                                                                          FontAwesomeIcons.apple,
                                                                          color: Colors.white,
                                                                          size: 30,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    logFirebaseEvent('KIRJAUDU_SIVU_Container_vna5zltq_ON_TAP');
                                                                    logFirebaseEvent('Container_update_widget_state');
                                                                    setState(() {
                                                                      _model.showSignInPhoneNumberField = false;
                                                                      _model.showEmailFields = true;
                                                                    });
                                                                  },
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3,
                                                                    shape: const CircleBorder(),
                                                                    child: Container(
                                                                      width: 60,
                                                                      height: 60,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF0F1113),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius: 5,
                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            offset: Offset(0, 2),
                                                                          )
                                                                        ],
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      alignment: AlignmentDirectional(0, 0),
                                                                      child: Icon(
                                                                        Icons.email_rounded,
                                                                        color: Colors.white,
                                                                        size: 30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    logFirebaseEvent('KIRJAUDU_SIVU_Container_e2aqo5hc_ON_TAP');
                                                                    logFirebaseEvent('Container_update_widget_state');
                                                                    setState(() {
                                                                      _model.showSignInPhoneNumberField = true;
                                                                      _model.showEmailFields = false;
                                                                    });
                                                                  },
                                                                  child: Material(
                                                                    color: Colors.transparent,
                                                                    elevation: 3,
                                                                    shape: const CircleBorder(),
                                                                    child: Container(
                                                                      width: 60,
                                                                      height: 60,
                                                                      decoration: BoxDecoration(
                                                                        color: Color(0xFF0F1113),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius: 5,
                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            offset: Offset(0, 2),
                                                                          )
                                                                        ],
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      alignment: AlignmentDirectional(0, 0),
                                                                      child: Icon(
                                                                        Icons.phone_sharp,
                                                                        color: Colors.white,
                                                                        size: 30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (valueOrDefault<bool>(
                                                    _model.showEmailFields,
                                                    false,
                                                  ))
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                          child: TextFormField(
                                                            controller: _model.emailAddressLoginController,
                                                            obscureText: false,
                                                            decoration: InputDecoration(
                                                              labelText: FFLocalizations.of(context).getText(
                                                                'o2cokl1b' /* Sähköpostiosoite */,
                                                              ),
                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF95A1AC),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF95A1AC),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              errorBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              focusedErrorBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors.white,
                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                            ),
                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                  fontFamily: 'Outfit',
                                                                  color: Color(0xFF0F1113),
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.normal,
                                                                ),
                                                            validator: _model.emailAddressLoginControllerValidator.asValidator(context),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                          child: TextFormField(
                                                            controller: _model.passwordLoginController,
                                                            obscureText: !_model.passwordLoginVisibility,
                                                            decoration: InputDecoration(
                                                              labelText: FFLocalizations.of(context).getText(
                                                                'di0t3kks' /* Salasana */,
                                                              ),
                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF95A1AC),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF95A1AC),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              errorBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              focusedErrorBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                  color: Color(0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors.white,
                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                              suffixIcon: InkWell(
                                                                onTap: () => setState(
                                                                  () => _model.passwordLoginVisibility = !_model.passwordLoginVisibility,
                                                                ),
                                                                focusNode: FocusNode(skipTraversal: true),
                                                                child: Icon(
                                                                  _model.passwordLoginVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                  color: Color(0xFF95A1AC),
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                  fontFamily: 'Outfit',
                                                                  color: Color(0xFF0F1113),
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.normal,
                                                                ),
                                                            validator: _model.passwordLoginControllerValidator.asValidator(context),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                          child: FFButtonWidget(
                                                            onPressed: () async {
                                                              logFirebaseEvent('KIRJAUDU_SIVU_PAGE_Button-Login_ON_TAP');
                                                              logFirebaseEvent('Button-Login_auth');
                                                              GoRouter.of(context).prepareAuthEvent();

                                                              final user = await authManager.signInWithEmail(
                                                                context,
                                                                _model.emailAddressLoginController.text,
                                                                _model.passwordLoginController.text,
                                                              );
                                                              if (user == null) {
                                                                return;
                                                              }

                                                              if (loggedIn) {
                                                                logFirebaseEvent('Button-Login_backend_call');

                                                                final usersUpdateData = createUsersRecordData(
                                                                  isAnonymous: false,
                                                                );
                                                                await currentUserReference!.update(usersUpdateData);
                                                                logFirebaseEvent('Button-Login_navigate_to');
                                                                if (Navigator.of(context).canPop()) {
                                                                  context.pop();
                                                                }
                                                                context.pushNamedAuth('paasivu', mounted);
                                                              }
                                                            },
                                                            text: FFLocalizations.of(context).getText(
                                                              'fj8qah3m' /* Kirjaudu */,
                                                            ),
                                                            options: FFButtonOptions(
                                                              width: 230,
                                                              height: 50,
                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                              elevation: 3,
                                                              borderSide: BorderSide(
                                                                color: Colors.transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: BorderRadius.circular(12),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                          child: FFButtonWidget(
                                                            onPressed: () async {
                                                              logFirebaseEvent('KIRJAUDU_SIVU_Button-ForgotPassword_ON_T');
                                                              logFirebaseEvent('Button-ForgotPassword_navigate_to');

                                                              context.pushNamed(
                                                                'forgotPassword_page',
                                                                queryParams: {
                                                                  'email': serializeParam(
                                                                    _model.emailAddressLoginController.text,
                                                                    ParamType.String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: FFLocalizations.of(context).getText(
                                                              'o0h72rrv' /* Unohditiko salasanasi? */,
                                                            ),
                                                            options: FFButtonOptions(
                                                              width: 170,
                                                              height: 40,
                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                              color: Color(0x0039D2C0),
                                                              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                    fontFamily: 'Outfit',
                                                                    color: Colors.white,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                              elevation: 0,
                                                              borderSide: BorderSide(
                                                                color: Colors.transparent,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!),
                                              if (valueOrDefault<bool>(
                                                _model.showSignInPhoneNumberField,
                                                false,
                                              ))
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                      child: TextFormField(
                                                        controller: _model.textfieldPhoneNumberController1,
                                                        autofillHints: [AutofillHints.telephoneNumber],
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          labelText: FFLocalizations.of(context).getText(
                                                            'a6h2047q' /* Puhelinnumero */,
                                                          ),
                                                          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(8),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                          prefixIcon: Icon(
                                                            Icons.phone_rounded,
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                              fontFamily: 'Outfit',
                                                              color: Color(0xFF0F1113),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                        maxLines: null,
                                                        validator: _model.textfieldPhoneNumberController1Validator.asValidator(context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent('KIRJAUDU_SIVU_Button-LoginWithPhoneNumbe');
                                                          logFirebaseEvent('Button-LoginWithPhoneNumber_auth');
                                                          final phoneNumberVal = _model.textfieldPhoneNumberController1.text;
                                                          if (phoneNumberVal == null || phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text(FFLocalizations.of(context).getText(
                                                                  'zr9l0xc3' /* ❗Puhelinnumero tarvitaan ja se... */,
                                                                )),
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                          await authManager.beginPhoneAuth(
                                                            context: context,
                                                            phoneNumber: phoneNumberVal,
                                                            onCodeSent: () async {
                                                              context.goNamedAuth(
                                                                'verifyPhoneNuber_page',
                                                                mounted,
                                                                ignoreRedirect: true,
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text: FFLocalizations.of(context).getText(
                                                          '2rl9emal' /* Lähetä vahvistuskoodi */,
                                                        ),
                                                        options: FFButtonOptions(
                                                          width: 230,
                                                          height: 50,
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          elevation: 3,
                                                          borderSide: BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation2']!),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(20, 22, 20, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(context).getText(
                                                          '85ixbazd' /* Luo tili seuraavilla vaihtoehd... */,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                              fontFamily: 'Outfit',
                                                              color: Color(0xC8FFFFFF),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent('KIRJAUDU_SIVU_Container_0khtpejl_ON_TAP');
                                                            logFirebaseEvent('Container_auth');
                                                            GoRouter.of(context).prepareAuthEvent();
                                                            final user = await authManager.signInWithGoogle(context);
                                                            if (user == null) {
                                                              return;
                                                            }

                                                            context.goNamedAuth('paasivu', mounted);
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF0F1113),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                  offset: Offset(0, 2),
                                                                )
                                                              ],
                                                              shape: BoxShape.circle,
                                                            ),
                                                            alignment: AlignmentDirectional(0, 0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons.google,
                                                              color: Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (isiOS)
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent('KIRJAUDU_SIVU_Container_4x61yn26_ON_TAP');
                                                              logFirebaseEvent('Container_auth');
                                                              GoRouter.of(context).prepareAuthEvent();
                                                              final user = await authManager.signInWithApple(context);
                                                              if (user == null) {
                                                                return;
                                                              }

                                                              context.goNamedAuth('paasivu', mounted);
                                                            },
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration: BoxDecoration(
                                                                color: Color(0xFF0F1113),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius: 5,
                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                    offset: Offset(0, 2),
                                                                  )
                                                                ],
                                                                shape: BoxShape.circle,
                                                              ),
                                                              alignment: AlignmentDirectional(0, 0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons.apple,
                                                                color: Colors.white,
                                                                size: 30,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent('KIRJAUDU_SIVU_Container_mlusneh8_ON_TAP');
                                                            logFirebaseEvent('Container_update_widget_state');
                                                            setState(() {
                                                              _model.showSignInPhoneNumberField = false;
                                                              _model.showEmailFields = true;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF0F1113),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                  offset: Offset(0, 2),
                                                                )
                                                              ],
                                                              shape: BoxShape.circle,
                                                            ),
                                                            alignment: AlignmentDirectional(0, 0),
                                                            child: Icon(
                                                              Icons.email_rounded,
                                                              color: Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors.transparent,
                                                          focusColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent('KIRJAUDU_SIVU_Container_8r32o2cr_ON_TAP');
                                                            logFirebaseEvent('Container_update_widget_state');
                                                            setState(() {
                                                              _model.showSignInPhoneNumberField = true;
                                                              _model.showEmailFields = false;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 60,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF0F1113),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                  offset: Offset(0, 2),
                                                                )
                                                              ],
                                                              shape: BoxShape.circle,
                                                            ),
                                                            alignment: AlignmentDirectional(0, 0),
                                                            child: Icon(
                                                              Icons.phone_sharp,
                                                              color: Colors.white,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (valueOrDefault<bool>(
                                                _model.showEmailFields,
                                                false,
                                              ))
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                      child: TextFormField(
                                                        controller: _model.emailAddressCreateAccController,
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          labelText: FFLocalizations.of(context).getText(
                                                            'bcx41kw3' /* Sähköpostiosoite */,
                                                          ),
                                                          labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Outfit',
                                                                color: Color(0xFF57636C),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                        ),
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Lexend Deca',
                                                              color: Color(0xFF14181B),
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                        validator: _model.emailAddressCreateAccControllerValidator.asValidator(context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                      child: TextFormField(
                                                        controller: _model.passwordCreateAccController,
                                                        obscureText: !_model.passwordCreateAccVisibility,
                                                        decoration: InputDecoration(
                                                          labelText: FFLocalizations.of(context).getText(
                                                            'h6m23xrn' /* Salasana */,
                                                          ),
                                                          labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Outfit',
                                                                color: Color(0xFF57636C),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                          suffixIcon: InkWell(
                                                            onTap: () => setState(
                                                              () => _model.passwordCreateAccVisibility = !_model.passwordCreateAccVisibility,
                                                            ),
                                                            focusNode: FocusNode(skipTraversal: true),
                                                            child: Icon(
                                                              _model.passwordCreateAccVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                              color: Color(0xFF95A1AC),
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Lexend Deca',
                                                              color: Color(0xFF14181B),
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                        validator: _model.passwordCreateAccControllerValidator.asValidator(context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                                      child: TextFormField(
                                                        controller: _model.passwordConfirmCreateAccController,
                                                        obscureText: !_model.passwordConfirmCreateAccVisibility,
                                                        decoration: InputDecoration(
                                                          labelText: FFLocalizations.of(context).getText(
                                                            'ljqsus3d' /* Kirjoita salasana uudelleen */,
                                                          ),
                                                          labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Outfit',
                                                                color: Color(0xFF57636C),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                          suffixIcon: InkWell(
                                                            onTap: () => setState(
                                                              () => _model.passwordConfirmCreateAccVisibility = !_model.passwordConfirmCreateAccVisibility,
                                                            ),
                                                            focusNode: FocusNode(skipTraversal: true),
                                                            child: Icon(
                                                              _model.passwordConfirmCreateAccVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                              color: Color(0xFF95A1AC),
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Lexend Deca',
                                                              color: Color(0xFF14181B),
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                        validator: _model.passwordConfirmCreateAccControllerValidator.asValidator(context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent('KIRJAUDU_SIVU_PAGE_LUO_TILI_BTN_ON_TAP');
                                                          if (true) {
                                                            logFirebaseEvent('Button_auth');
                                                            GoRouter.of(context).prepareAuthEvent();
                                                            if (_model.passwordCreateAccController.text != _model.passwordConfirmCreateAccController.text) {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    FFLocalizations.of(context).getText(
                                                                      'r9kev20w' /* 🙅 Salasanat eivät täsmää */,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                              return;
                                                            }

                                                            final user = await authManager.createAccountWithEmail(
                                                              context,
                                                              _model.emailAddressCreateAccController.text,
                                                              _model.passwordCreateAccController.text,
                                                            );
                                                            if (user == null) {
                                                              return;
                                                            }

                                                            logFirebaseEvent('Button_backend_call');

                                                            final usersUpdateData = {
                                                              ...createUsersRecordData(
                                                                isAnonymous: false,
                                                                email: '',
                                                              ),
                                                              'anonymousAccounts': FieldValue.arrayUnion([FFAppState().anonymouslyLoggedInUserAccountRef]),
                                                            };
                                                            await currentUserReference!.update(usersUpdateData);
                                                            logFirebaseEvent('Button_navigate_to');
                                                            if (Navigator.of(context).canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamedAuth('paasivu', mounted);
                                                          }
                                                        },
                                                        text: FFLocalizations.of(context).getText(
                                                          '73gnjam6' /* Luo tili */,
                                                        ),
                                                        options: FFButtonOptions(
                                                          width: 230,
                                                          height: 50,
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          elevation: 3,
                                                          borderSide: BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation3']!),
                                              if (valueOrDefault<bool>(
                                                _model.showSignInPhoneNumberField,
                                                false,
                                              ))
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                      child: TextFormField(
                                                        controller: _model.textfieldPhoneNumberController2,
                                                        autofillHints: [AutofillHints.telephoneNumber],
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          labelText: FFLocalizations.of(context).getText(
                                                            '5dkq9pkt' /* Puhelinnumero */,
                                                          ),
                                                          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          hintText: FFLocalizations.of(context).getText(
                                                            'mffdiz61' /* +358... */,
                                                          ),
                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF95A1AC),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                              color: Color(0x00000000),
                                                              width: 1,
                                                            ),
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                                          prefixIcon: Icon(
                                                            Icons.phone_rounded,
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                              fontFamily: 'Outfit',
                                                              color: Color(0xFF0F1113),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.normal,
                                                            ),
                                                        validator: _model.textfieldPhoneNumberController2Validator.asValidator(context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent('KIRJAUDU_SIVU_Button-LoginWithPhoneNumbe');
                                                          logFirebaseEvent('Button-LoginWithPhoneNumber_auth');
                                                          final phoneNumberVal = _model.textfieldPhoneNumberController2.text;
                                                          if (phoneNumberVal == null || phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text(FFLocalizations.of(context).getText(
                                                                  'zr9l0xc3' /* ❗Puhelinnumero tarvitaan ja se... */,
                                                                )),
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                          await authManager.beginPhoneAuth(
                                                            context: context,
                                                            phoneNumber: phoneNumberVal,
                                                            onCodeSent: () async {
                                                              context.goNamedAuth(
                                                                'verifyPhoneNuber_page',
                                                                mounted,
                                                                ignoreRedirect: true,
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text: FFLocalizations.of(context).getText(
                                                          'djspg1ze' /* Lähetä vahvistuskoodi */,
                                                        ),
                                                        options: FFButtonOptions(
                                                          width: 230,
                                                          height: 50,
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                          color: FlutterFlowTheme.of(context).tertiary,
                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Colors.white,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                          elevation: 3,
                                                          borderSide: BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation4']!),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

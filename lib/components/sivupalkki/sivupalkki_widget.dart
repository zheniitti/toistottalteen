import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sivupalkki_model.dart';
export 'sivupalkki_model.dart';

class SivupalkkiWidget extends StatefulWidget {
  const SivupalkkiWidget({Key? key}) : super(key: key);

  @override
  _SivupalkkiWidgetState createState() => _SivupalkkiWidgetState();
}

class _SivupalkkiWidgetState extends State<SivupalkkiWidget> {
  late SivupalkkiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivupalkkiModel());

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

    return Stack(
      children: [
        ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 30.0,
              sigmaY: 30.0,
            ),
            child: Image.asset(
              'assets/images/man_pull_up_black_and_whitepng.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0x26FFFFFF),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (currentUserEmail != null &&
                                    currentUserEmail != '')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00000000),
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 22.0, 0.0),
                                                  child: Icon(
                                                    Icons.person_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      currentUserEmail,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Visibility(
                                            visible: false,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 0.0,
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                            ),
                                          ),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SIVUPALKKI_COMP_RichText_6ycy9n8r_ON_TAP');
                                                  logFirebaseEvent(
                                                      'RichText_copy_to_clipboard');
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text:
                                                              currentUserReference!
                                                                  .id));
                                                  logFirebaseEvent(
                                                      'RichText_close_dialog,_drawer,_etc');
                                                  Navigator.pop(context);
                                                  logFirebaseEvent(
                                                      'RichText_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          fiText: 'Kopioitu!',
                                                          enText: 'Kopied!',
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                    ),
                                                  );
                                                },
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'UID:  ',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            currentUserReference!
                                                                .id,
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (currentUserEmail == null ||
                                    currentUserEmail == '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SIVUPALKKI_COMP_Row_48iupzve_ON_TAP');
                                        logFirebaseEvent(
                                            'Row_close_dialog,_drawer,_etc');
                                        Navigator.pop(context);
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                          'kirjaudu_sivu',
                                          queryParams: {
                                            'initialIndex': serializeParam(
                                              1,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 22.0, 0.0),
                                            child: Icon(
                                              Icons.person_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 30.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ku53fmbs' /* Luo tili tai kirjaudu */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (false)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SIVUPALKKI_COMP_Row_2iowzp08_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_close_dialog,_drawer,_etc');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            FFAppState().update(() {
                                              FFAppState().navBarIndex = 0;
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 22.0, 0.0),
                                                child: Icon(
                                                  Icons.sticky_note_2,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'SIVUPALKKI_Text_treenirutiinit_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_treenirutiinit_close_dialog,_drawer');
                                                    Navigator.pop(context);
                                                    logFirebaseEvent(
                                                        'Text_treenirutiinit_update_app_state');
                                                    FFAppState().update(() {
                                                      FFAppState().navBarIndex =
                                                          0;
                                                    });
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tmzzbmg6' /* Treenirutiinit */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SIVUPALKKI_COMP_Row_c295vkmc_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_close_dialog,_drawer,_etc');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            setState(() {
                                              FFAppState().navBarIndex = 1;
                                              FFAppState()
                                                      .showTreenaaTaiLuoRutiiniSivu =
                                                  true;
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 22.0, 0.0),
                                                child: Icon(
                                                  Icons
                                                      .accessibility_new_rounded,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getVariableText(
                                                            fiText: 'Treenaa',
                                                            enText: 'Workout',
                                                          ),
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            't717139a' /*   (käynnissä) */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 22.0, 0.0),
                                              child: Icon(
                                                Icons.event_note_rounded,
                                                color: Colors.black,
                                                size: 30.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kmmmsdb7' /* Treenihistoria */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                if (getRemoteConfigBool(
                                    'isEnabled_statisticsPage'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SIVUPALKKI_COMP_Row_95lguv3f_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed('tilastot_sivu');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 22.0, 0.0),
                                            child: Icon(
                                              Icons.insert_chart_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 30.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'e4qtfwaz' /* Treenitilastot */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (getRemoteConfigBool(
                                    'isEnabled_subscription'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 16.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SIVUPALKKI_COMP_Row_rnd97pam_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed('subrictionPage');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 22.0, 0.0),
                                            child: Icon(
                                              Icons.auto_awesome,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 30.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uvhkl89u' /* Premiumjäsenyys */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (getRemoteConfigBool('showSendFeedabkPage'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SIVUPALKKI_COMP_Row_ybqd0d9j_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed('FeedbackPage');
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 22.0, 0.0),
                                            child: Icon(
                                              Icons.chat_bubble_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 30.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mu0qny93' /* Lähetä palaute */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x26FFFFFF),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: FlutterFlowLanguageSelector(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 40.0,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hideFlags: false,
                              flagSize: 24.0,
                              flagTextGap: 8.0,
                              currentLanguage:
                                  FFLocalizations.of(context).languageCode,
                              languages: FFLocalizations.languages(),
                              onChanged: (lang) =>
                                  setAppLanguage(context, lang),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          if (false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SIVUPALKKI_COMP_Row_vh1jhxe6_ON_TAP');
                                  logFirebaseEvent('Row_navigate_to');

                                  context.pushNamed('FeedbackPage');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 22.0, 0.0),
                                      child: Icon(
                                        Icons.chat_bubble_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 30.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ornov325' /* Tietoa sovelluksesta */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIVUPALKKI_COMP_Text_4b9wzens_ON_TAP');
                                logFirebaseEvent('Text_navigate_to');

                                context.pushNamed(
                                  'Webview1',
                                  queryParams: {
                                    'url': serializeParam(
                                      getRemoteConfigString('privacyPolicyUrl'),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '2ttiy67c' /* Tietosuoja ja käyttöehdot */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                              ),
                            ),
                          ),
                          if (false)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SIVUPALKKI_COMP_Text_4j47elvn_ON_TAP');
                                  logFirebaseEvent('Text_navigate_to');

                                  context.pushNamed('FeedbackPage');
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ny2fhrqk' /* Lähetä palaute */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SIVUPALKKI_COMP_Text_uiifcf87_ON_TAP');
                                logFirebaseEvent('Text_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                logFirebaseEvent('Text_update_app_state');
                                FFAppState().deleteNavBarIndex();
                                FFAppState().navBarIndex = 1;

                                FFAppState()
                                    .deleteValittuTreenattavaHistorianSessioRef();
                                FFAppState()
                                        .valittuTreenattavaHistorianSessioRef =
                                    null;

                                FFAppState()
                                    .deleteValittuTreenattavaTreeniRutiini();
                                FFAppState().valittuTreenattavaTreeniRutiini =
                                    null;

                                FFAppState().isEditing = false;
                                FFAppState().showTreenaaTaiLuoRutiiniSivu =
                                    false;
                                FFAppState().deleteIsCreatingRutiini();
                                FFAppState().isCreatingRutiini = false;

                                FFAppState().searchbarText = '';
                                FFAppState().kopiedLiikeListFirestoreData = [];
                                FFAppState().sessioChunkListLastItemDateTime =
                                    [];
                                FFAppState().valittuMuokattavaRutiini = null;
                                FFAppState().valittuMuokattavaLiikeIndex = -1;
                                FFAppState().kopioidutLiikkeet = [];
                                FFAppState().isLatestUnfinnishedWorkout = false;
                                FFAppState().anonymousUserRef = null;

                                context.goNamedAuth('getStarted_sivu', mounted);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'nn03r681' /* Kirjaudu ulos */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

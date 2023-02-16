import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/toistot_talteen_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../treeni_rutiinit/treeni_rutiinit_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'get_started_page_model.dart';
export 'get_started_page_model.dart';

class GetStartedPageWidget extends StatefulWidget {
  const GetStartedPageWidget({Key? key}) : super(key: key);

  @override
  _GetStartedPageWidgetState createState() => _GetStartedPageWidgetState();
}

class _GetStartedPageWidgetState extends State<GetStartedPageWidget>
    with TickerProviderStateMixin {
  late GetStartedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
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
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
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
    _model = createModel(context, () => GetStartedPageModel());
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional(0, 0),
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/woman_gym_black_and_white_.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: FutureBuilder<List<EsimerkkiDataRecord>>(
                  future: queryEsimerkkiDataRecordOnce(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<EsimerkkiDataRecord> columnEsimerkkiDataRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnEsimerkkiDataRecord =
                        columnEsimerkkiDataRecordList.isNotEmpty
                            ? columnEsimerkkiDataRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: wrapWithModel(
                            model: _model.toistotTalteenModel,
                            updateCallback: () => setState(() {}),
                            child: ToistotTalteenWidget(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 21),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'aizxhddb' /* Tallenna treenisuoritukset */,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      color:
                                          FlutterFlowTheme.of(context).dadada,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      47, 0, 47, 37),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'lpepy92t' /* Kirjaa muistiin treeniharjoitt... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      color:
                                          FlutterFlowTheme.of(context).c797979,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  final user = await signInAnonymously(context);
                                  if (user == null) {
                                    return;
                                  }
                                  if (currentUserReference != null) {
                                    // create appData doc

                                    final appDataCreateData = {
                                      ...createAppDataRecordData(
                                        userRef: currentUserReference,
                                        appLangCode: FFLocalizations.of(context)
                                            .languageCode,
                                        darkMode: false,
                                      ),
                                      'docCreatedTime':
                                          FieldValue.serverTimestamp(),
                                      'treeniRutiinit':
                                          getTreeniRutiiniListFirestoreData(
                                        columnEsimerkkiDataRecord!
                                            .esimerkkiRutiinit!
                                            .toList(),
                                      ),
                                      'treeniliikeNimet':
                                          columnEsimerkkiDataRecord!
                                              .esimerkkiLiikkeet!
                                              .toList()
                                              .map((e) => e.nimi)
                                              .withoutNulls
                                              .toList(),
                                      'treeniSessiot':
                                          getTreeniSessioListFirestoreData(
                                        columnEsimerkkiDataRecord!
                                            .esimerkkiSessiot!
                                            .toList(),
                                      ),
                                    };
                                    var appDataRecordReference =
                                        AppDataRecord.collection.doc();
                                    await appDataRecordReference
                                        .set(appDataCreateData);
                                    _model.appData =
                                        AppDataRecord.getDocumentFromData(
                                            appDataCreateData,
                                            appDataRecordReference);
                                    // update userDoc appData field

                                    final usersUpdateData =
                                        createUsersRecordData(
                                      appDataRef: _model.appData!.reference,
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData);
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: TreeniRutiinitWidget(),
                                      ),
                                      (r) => false,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            fiText:
                                                'Jotain meni vikaan... Tarkista nettiyhteytesi',
                                            enText:
                                                'Something went wrong... Check your internet connection',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 8000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'l8prkehd' /* Seuraava */,
                                ),
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 80,
                                  color: FlutterFlowTheme.of(context).f6f6f6,
                                  textStyle: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

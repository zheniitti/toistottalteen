import '../components/back_button_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favourite_page_model.dart';
export 'favourite_page_model.dart';

class FavouritePageWidget extends StatefulWidget {
  const FavouritePageWidget({Key? key}) : super(key: key);

  @override
  _FavouritePageWidgetState createState() => _FavouritePageWidgetState();
}

class _FavouritePageWidgetState extends State<FavouritePageWidget>
    with TickerProviderStateMixin {
  late FavouritePageModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'backButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 300.ms,
          begin: Offset(20, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 300.ms,
          begin: Offset(0, -10),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 300.ms,
          begin: Offset(0, 10),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouritePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, -1),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://i.scdn.co/image/ab6761610000e5eb12a2ef08d00dd7451a6dbed6',
                    ).image,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(69),
                    bottomRight: Radius.circular(69),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(32, 30, 32, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.backButtonModel,
                          updateCallback: () => setState(() {}),
                          child: BackButtonWidget(),
                        ).animateOnPageLoad(
                            animationsMap['backButtonOnPageLoadAnimation']!),
                        SvgPicture.asset(
                          'assets/images/vert.svg',
                          width: 32,
                          height: 18,
                          fit: BoxFit.scaleDown,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
              child: Text(
                FFLocalizations.of(context).getText(
                  'zgkylfxt' /* Ed Sheeran */,
                ),
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  color: FlutterFlowTheme.of(context).e1e1e1,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Text(
                FFLocalizations.of(context).getText(
                  'fj4mc0q5' /* 5 Album , 256 Track */,
                ),
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  color: FlutterFlowTheme.of(context).d6d6d6,
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 10),
              child: Text(
                FFLocalizations.of(context).getText(
                  '70uzvugp' /* Edward Christopher Sheeran MBE... */,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  color: FlutterFlowTheme.of(context).d6d6d6,
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation3']!),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(29, 0, 0, 17),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '6uhvfrr8' /* Albums */,
                  ),
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    color: FlutterFlowTheme.of(context).dddddd,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation4']!),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 28,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://i.scdn.co/image/ab67616d00001e02737c1bef4d45db62ac6dd2f1',
                              width: 140,
                              height: 135,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'in0j6vlt' /* = (Tour Edition) */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).d6d6d6,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 16,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://i.scdn.co/image/ab67616d00001e027ed2a6d678a53a5959b2894f',
                              width: 140,
                              height: 135,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'rbvytv3i' /* No.6 Collaboration ... */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).d6d6d6,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 16,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://i.scdn.co/image/ab67616d00001e02ba5db46f4b838ef6027e6f96',
                              width: 140,
                              height: 135,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'r4fhi2mi' /* ÷ (Deluxe) */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).d6d6d6,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 16,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://i.scdn.co/image/ab67616d00001e02407981084d79d283e24d428e',
                              width: 140,
                              height: 135,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            't8tbhx9a' /* x (Wembley Edition) */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).d6d6d6,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 16,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              'https://i.scdn.co/image/ab67616d00001e02ed139c2e0e3681cc2d35e256',
                              width: 140,
                              height: 135,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'za8w437i' /* + */,
                          ),
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            color: FlutterFlowTheme.of(context).d6d6d6,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 28,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation1']!),
            ),
            if (FFAppState().currentIndex == 0)
              Align(
                alignment: AlignmentDirectional(0, 1.94),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(29, 26, 29, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '973m28ev' /* Songs */,
                            ),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).dbdbdb,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'p2vozggh' /* See More */,
                            ),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              color: FlutterFlowTheme.of(context).c6c6c6,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation2']!),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(28, 0, 27, 85),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                              child: SvgPicture.asset(
                                'assets/images/play.svg',
                                width: 37,
                                height: 37,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'lagn53da' /* Celestial */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'dthj8id0' /* Pokemon x Ed Sheeran */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                's0j2mpg6' /* 03:29 */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(49, 0, 0, 0),
                              child: SvgPicture.asset(
                                'assets/images/heart_filled.svg',
                                width: 21,
                                height: 21,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                              child: SvgPicture.asset(
                                'assets/images/play.svg',
                                width: 37,
                                height: 37,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'jhhathih' /* Bam Bam */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '62zjeea2' /* Camiila Cabello x Ed Sh... */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '8s3r0cyq' /* 03:26 */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(49, 0, 0, 0),
                              child: SvgPicture.asset(
                                'assets/images/heart_filled.svg',
                                width: 21,
                                height: 21,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                              child: SvgPicture.asset(
                                'assets/images/play.svg',
                                width: 37,
                                height: 37,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'vo1z9jfg' /* Merry Christmas */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'vh5hts3g' /* Elton John x Ed Sheeran */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qblr47xy' /* 03:28 */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(49, 0, 0, 0),
                              child: SvgPicture.asset(
                                'assets/images/heart_filled.svg',
                                width: 21,
                                height: 21,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                              child: SvgPicture.asset(
                                'assets/images/play.svg',
                                width: 37,
                                height: 37,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'j8h6603m' /* TJATQ */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'i92inv3i' /* Tylor Swift x Ed Sheeran */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).d6d6d6,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '3fr3cetm' /* 03:05 */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(49, 0, 0, 0),
                              child: SvgPicture.asset(
                                'assets/images/heart_filled.svg',
                                width: 21,
                                height: 21,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 23, 0),
                            child: SvgPicture.asset(
                              'assets/images/play.svg',
                              width: 37,
                              height: 37,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'a4mfeytx' /* Call on me */,
                                ),
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).d6d6d6,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'a9tck26d' /* Vianney x Ed Sheeran */,
                                ),
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).d6d6d6,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'ymmr475n' /* 03:20 */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(49, 0, 0, 0),
                            child: SvgPicture.asset(
                              'assets/images/heart_filled.svg',
                              width: 21,
                              height: 21,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
          ],
        ),
      ),
    );
  }
}

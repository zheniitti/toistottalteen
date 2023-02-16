import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toistot_talteen_model.dart';
export 'toistot_talteen_model.dart';

class ToistotTalteenWidget extends StatefulWidget {
  const ToistotTalteenWidget({Key? key}) : super(key: key);

  @override
  _ToistotTalteenWidgetState createState() => _ToistotTalteenWidgetState();
}

class _ToistotTalteenWidgetState extends State<ToistotTalteenWidget>
    with TickerProviderStateMixin {
  late ToistotTalteenModel _model;

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
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToistotTalteenModel());
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
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 21),
        child: Text(
          FFLocalizations.of(context).getText(
            'ezf7x56w' /* Toistot Talteen */,
          ),
          style: TextStyle(
            fontFamily: 'Satoshi',
            color: FlutterFlowTheme.of(context).dadada,
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
      ),
    );
  }
}

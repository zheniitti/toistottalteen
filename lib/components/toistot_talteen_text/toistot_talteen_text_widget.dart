import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toistot_talteen_text_model.dart';
export 'toistot_talteen_text_model.dart';

class ToistotTalteenTextWidget extends StatefulWidget {
  const ToistotTalteenTextWidget({Key? key}) : super(key: key);

  @override
  _ToistotTalteenTextWidgetState createState() =>
      _ToistotTalteenTextWidgetState();
}

class _ToistotTalteenTextWidgetState extends State<ToistotTalteenTextWidget>
    with TickerProviderStateMixin {
  late ToistotTalteenTextModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => ToistotTalteenTextModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 21.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'ezf7x56w' /* Toistot Talteen */,
          ),
          style: TextStyle(
            fontFamily: 'Satoshi',
            color: Color(0xFFDADADA),
            fontWeight: FontWeight.w600,
            fontSize: 30.0,
          ),
        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
      ),
    );
  }
}

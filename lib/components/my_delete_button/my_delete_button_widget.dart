import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_delete_button_model.dart';
export 'my_delete_button_model.dart';

class MyDeleteButtonWidget extends StatefulWidget {
  const MyDeleteButtonWidget({Key? key}) : super(key: key);

  @override
  _MyDeleteButtonWidgetState createState() => _MyDeleteButtonWidgetState();
}

class _MyDeleteButtonWidgetState extends State<MyDeleteButtonWidget> {
  late MyDeleteButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyDeleteButtonModel());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Container(
        width: 100.0,
        height: 36.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_rounded,
              color: Colors.black,
              size: 24.0,
            ),
            Text(
              FFLocalizations.of(context).getText(
                '8t3o2ple' /* Poista */,
              ),
              style: FlutterFlowTheme.of(context).subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

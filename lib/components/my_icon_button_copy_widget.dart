import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_icon_button_copy_model.dart';
export 'my_icon_button_copy_model.dart';

class MyIconButtonCopyWidget extends StatefulWidget {
  const MyIconButtonCopyWidget({Key? key}) : super(key: key);

  @override
  _MyIconButtonCopyWidgetState createState() => _MyIconButtonCopyWidgetState();
}

class _MyIconButtonCopyWidgetState extends State<MyIconButtonCopyWidget> {
  late MyIconButtonCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyIconButtonCopyModel());
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
      alignment: AlignmentDirectional(-1, 0),
      child: Container(
        width: 100,
        height: 36,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: AlignmentDirectional(0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_rounded,
              color: Colors.black,
              size: 24,
            ),
            Text(
              FFLocalizations.of(context).getText(
                'dy1gb863' /* Poista */,
              ),
              style: FlutterFlowTheme.of(context).title3,
            ),
          ],
        ),
      ),
    );
  }
}

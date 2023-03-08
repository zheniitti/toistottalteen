import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liike_model.dart';
export 'liike_model.dart';

class LiikeWidget extends StatefulWidget {
  const LiikeWidget({
    Key? key,
    this.liike,
  }) : super(key: key);

  final LiikeStruct? liike;

  @override
  _LiikeWidgetState createState() => _LiikeWidgetState();
}

class _LiikeWidgetState extends State<LiikeWidget> {
  late LiikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiikeModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: SelectionArea(
                      child: Text(
                    widget.liike!.nimi!,
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle2,
                  )),
                ),
                if (widget.liike?.kommentti != null &&
                    widget.liike?.kommentti != '')
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      widget.liike!.kommentti!,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                functions.liikkeenToistot(widget.liike),
                ' - ',
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liikkeet_lista_model.dart';
export 'liikkeet_lista_model.dart';

class LiikkeetListaWidget extends StatefulWidget {
  const LiikkeetListaWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _LiikkeetListaWidgetState createState() => _LiikkeetListaWidgetState();
}

class _LiikkeetListaWidgetState extends State<LiikkeetListaWidget> {
  late LiikkeetListaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiikkeetListaModel());

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

    return Builder(
      builder: (context) {
        final liikkeet = widget.rutiini?.liikkeet?.toList()?.toList() ?? [];
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(liikkeet.length, (liikkeetIndex) {
            final liikkeetItem = liikkeet[liikkeetIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
              child: Container(
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
                              liikkeetItem.nimi!,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            )),
                          ),
                          if (liikkeetItem.kommentti != null &&
                              liikkeetItem.kommentti != '')
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                liikkeetItem.kommentti!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.liikkeenToistot(liikkeetItem),
                          ' - ',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

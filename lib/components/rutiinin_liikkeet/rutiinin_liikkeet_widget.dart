import '/backend/backend.dart';
import '/components/rutiinin_liike_kommentti_textfield/rutiinin_liike_kommentti_textfield_widget.dart';
import '/components/rutiinin_liike_nimi_textfield/rutiinin_liike_nimi_textfield_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiinin_liikkeet_model.dart';
export 'rutiinin_liikkeet_model.dart';

class RutiininLiikkeetWidget extends StatefulWidget {
  const RutiininLiikkeetWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _RutiininLiikkeetWidgetState createState() => _RutiininLiikkeetWidgetState();
}

class _RutiininLiikkeetWidgetState extends State<RutiininLiikkeetWidget> {
  late RutiininLiikkeetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiininLiikkeetModel());

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
          mainAxisSize: MainAxisSize.min,
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
                          RutiininLiikeNimiTextfieldWidget(
                            key: Key(
                                'Key8jh_${liikkeetIndex}_of_${liikkeet.length}'),
                            liikeIndex: liikkeetIndex,
                            rutiini: widget.rutiini,
                            liike: liikkeetItem,
                          ),
                          RutiininLiikeKommenttiTextfieldWidget(
                            key: Key(
                                'Keyst7_${liikkeetIndex}_of_${liikkeet.length}'),
                            liikeIndex: liikkeetIndex,
                            rutiini: widget.rutiini,
                            liike: liikkeetItem,
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: valueOrDefault<String>(
                              functions.rutiininToistotJaPaino(liikkeetItem),
                              ' - ',
                            ),
                            style: FlutterFlowTheme.of(context).subtitle2,
                          )
                        ],
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

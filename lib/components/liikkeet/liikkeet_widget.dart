import '/backend/backend.dart';
import '/components/liike/liike_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'liikkeet_model.dart';
export 'liikkeet_model.dart';

class LiikkeetWidget extends StatefulWidget {
  const LiikkeetWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _LiikkeetWidgetState createState() => _LiikkeetWidgetState();
}

class _LiikkeetWidgetState extends State<LiikkeetWidget> {
  late LiikkeetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiikkeetModel());

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
              child: wrapWithModel(
                model: _model.liikeModels.getModel(
                  widget.rutiini!.createdTime!.toString(),
                  liikkeetIndex,
                ),
                updateCallback: () => setState(() {}),
                child: LiikeWidget(
                  key: Key(
                    'Key0h9_${widget.rutiini!.createdTime!.toString()}',
                  ),
                  liike: liikkeetItem,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

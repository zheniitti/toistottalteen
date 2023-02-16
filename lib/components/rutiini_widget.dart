import '../backend/backend.dart';
import '../components/liike_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rutiini_model.dart';
export 'rutiini_model.dart';

class RutiiniWidget extends StatefulWidget {
  const RutiiniWidget({
    Key? key,
    this.rutiini,
  }) : super(key: key);

  final TreeniRutiiniStruct? rutiini;

  @override
  _RutiiniWidgetState createState() => _RutiiniWidgetState();
}

class _RutiiniWidgetState extends State<RutiiniWidget> {
  late RutiiniModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RutiiniModel());
  }

  @override
  void dispose() {
    _model.dispose();

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
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
              child: LiikeWidget(
                key: Key('Key0h9_${liikkeetIndex}_of_${liikkeet.length}'),
                liike: liikkeetItem,
              ),
            );
          }),
        );
      },
    );
  }
}

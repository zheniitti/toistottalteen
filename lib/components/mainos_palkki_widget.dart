import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mainos_palkki_model.dart';
export 'mainos_palkki_model.dart';

class MainosPalkkiWidget extends StatefulWidget {
  const MainosPalkkiWidget({Key? key}) : super(key: key);

  @override
  _MainosPalkkiWidgetState createState() => _MainosPalkkiWidgetState();
}

class _MainosPalkkiWidgetState extends State<MainosPalkkiWidget> {
  late MainosPalkkiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainosPalkkiModel());

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

    return Visibility(
      visible: FFAppState().showAdbanner,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 1000.0,
          maxHeight: 60.0,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: FlutterFlowAdBanner(
          showsTestAd: true,
          iOSAdUnitID: 'ca-app-pub-6667798289242281/3798313004',
          androidAdUnitID: 'ca-app-pub-6667798289242281/8613432088',
        ),
      ),
    );
  }
}

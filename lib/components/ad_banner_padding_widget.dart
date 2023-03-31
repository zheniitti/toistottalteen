import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ad_banner_padding_model.dart';
export 'ad_banner_padding_model.dart';

class AdBannerPaddingWidget extends StatefulWidget {
  const AdBannerPaddingWidget({Key? key}) : super(key: key);

  @override
  _AdBannerPaddingWidgetState createState() => _AdBannerPaddingWidgetState();
}

class _AdBannerPaddingWidgetState extends State<AdBannerPaddingWidget> {
  late AdBannerPaddingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdBannerPaddingModel());

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
      visible: revenue_cat.activeEntitlementIds.length == 0,
      child: Container(
        width: 100.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Color(0x1614181B),
        ),
      ),
    );
  }
}

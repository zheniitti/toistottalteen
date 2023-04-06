import '/backend/backend.dart';
import '/components/ad_banner_padding_widget.dart';
import '/components/sessio_chunk_lista_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SivuTreeniHistoriaKomponenttiModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for AdBannerPadding component.
  late AdBannerPaddingModel adBannerPaddingModel;
  // Model for sessioChunkLista component.
  late SessioChunkListaModel sessioChunkListaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adBannerPaddingModel = createModel(context, () => AdBannerPaddingModel());
    sessioChunkListaModel = createModel(context, () => SessioChunkListaModel());
  }

  void dispose() {
    adBannerPaddingModel.dispose();
    sessioChunkListaModel.dispose();
  }

  /// Additional helper methods are added here.

}

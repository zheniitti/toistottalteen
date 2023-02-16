import '../components/album_details_tile_widget.dart';
import '../components/song_details_tile_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../song_details_page/song_details_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for SongDetailsTile component.
  late SongDetailsTileModel songDetailsTileModel;
  // Model for AlbumDetailsTile component.
  late AlbumDetailsTileModel albumDetailsTileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    songDetailsTileModel = createModel(context, () => SongDetailsTileModel());
    albumDetailsTileModel = createModel(context, () => AlbumDetailsTileModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}

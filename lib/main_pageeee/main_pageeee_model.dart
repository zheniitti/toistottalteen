import '../components/bottom_nav_bar_widget.dart';
import '../components/favourite_page_widget.dart';
import '../components/home_page_widget.dart';
import '../components/profile_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageeeeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for HomePage component.
  late HomePageModel homePageModel;
  // Model for FavouritePage component.
  late FavouritePageModel favouritePageModel;
  // Model for ProfilePage component.
  late ProfilePageModel profilePageModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homePageModel = createModel(context, () => HomePageModel());
    favouritePageModel = createModel(context, () => FavouritePageModel());
    profilePageModel = createModel(context, () => ProfilePageModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}

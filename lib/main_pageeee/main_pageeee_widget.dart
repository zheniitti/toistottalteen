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
import 'main_pageeee_model.dart';
export 'main_pageeee_model.dart';

class MainPageeeeWidget extends StatefulWidget {
  const MainPageeeeWidget({Key? key}) : super(key: key);

  @override
  _MainPageeeeWidgetState createState() => _MainPageeeeWidgetState();
}

class _MainPageeeeWidgetState extends State<MainPageeeeWidget> {
  late MainPageeeeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageeeeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Stack(
              alignment: AlignmentDirectional(0, 0),
              children: [
                if (FFAppState().currentIndex == 0)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: wrapWithModel(
                      model: _model.homePageModel,
                      updateCallback: () => setState(() {}),
                      child: HomePageWidget(),
                    ),
                  ),
                if (FFAppState().currentIndex == 1)
                  wrapWithModel(
                    model: _model.favouritePageModel,
                    updateCallback: () => setState(() {}),
                    child: FavouritePageWidget(),
                  ),
                if (FFAppState().currentIndex == 2)
                  wrapWithModel(
                    model: _model.profilePageModel,
                    updateCallback: () => setState(() {}),
                    child: ProfilePageWidget(),
                  ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: wrapWithModel(
                    model: _model.bottomNavBarModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavBarWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

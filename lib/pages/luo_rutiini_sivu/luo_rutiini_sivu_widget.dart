import '/backend/backend.dart';
import '/components/liike/liike_widget.dart';
import '/components/treeni_liike_form/treeni_liike_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'luo_rutiini_sivu_model.dart';
export 'luo_rutiini_sivu_model.dart';

class LuoRutiiniSivuWidget extends StatefulWidget {
  const LuoRutiiniSivuWidget({Key? key}) : super(key: key);

  @override
  _LuoRutiiniSivuWidgetState createState() => _LuoRutiiniSivuWidgetState();
}

class _LuoRutiiniSivuWidgetState extends State<LuoRutiiniSivuWidget> {
  late LuoRutiiniSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LuoRutiiniSivuModel());

    _model.rutiininnimiController ??= TextEditingController();
    _model.rutiiniKommenttiController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      floatingActionButton: Visibility(
        visible: !_model.showLuoLiikeForm,
        child: FloatingActionButton.extended(
          onPressed: () async {
            context.pop();
          },
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          elevation: 8.0,
          label: Text(
            FFLocalizations.of(context).getText(
              '2b1k7jba' /* Valmis */,
            ),
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'xr4kgiol' /* Treenirutiinin luominen */,
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryColor,
                  ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Icon(
                  Icons.help_outline_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Builder(builder: (_) {
                      final child = Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller: _model.rutiininnimiController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.rutiininnimiController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          setState(() {
                                            _model.luotavaRutiini =
                                                _model.luotavaRutiini;
                                          });
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '3zslehjv' /* Rutiinin / ohjelman nimi */,
                                        ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'hyob330v' /* esim Ylövartalo, Työhtävät tai... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      maxLines: 3,
                                      minLines: 1,
                                      validator: _model
                                          .rutiininnimiControllerValidator
                                          .asValidator(context),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.rutiiniKommenttiController,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'vps9eyym' /* Kommentti / ohjeet (vapaaehtoi... */,
                                          ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'oeb00uyr' /* esim. Tämä on kokonaisvaltaine... */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        maxLines: 5,
                                        minLines: 1,
                                        validator: _model
                                            .rutiiniKommenttiControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                                Builder(
                                  builder: (context) {
                                    final luodutLiikkeet = _model
                                            .luotavaRutiini?.liikkeet
                                            ?.toList()
                                            ?.toList() ??
                                        [];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(luodutLiikkeet.length,
                                              (luodutLiikkeetIndex) {
                                        final luodutLiikkeetItem =
                                            luodutLiikkeet[luodutLiikkeetIndex];
                                        return LiikeWidget(
                                          key: Key(
                                              'Keynpv_${luodutLiikkeetIndex}_of_${luodutLiikkeet.length}'),
                                          liike: null,
                                        );
                                      }),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              _model.showLuoLiikeForm = true;
                                            });
                                          },
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'sxlzl4hk' /* Lisää treeniliike */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      if (_model.showLuoLiikeForm) {
                        return ClipRect(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 0.0,
                              sigmaY: 0.0,
                            ),
                            child: child,
                          ),
                        );
                      }
                      return child;
                    }),
                    if (_model.showLuoLiikeForm)
                      InkWell(
                        onTap: () async {
                          setState(() {
                            _model.showLuoLiikeForm = false;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_model.showLuoLiikeForm)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 100.0, 12.0, 12.0),
                          child: wrapWithModel(
                            model: _model.treeniLiikeFormModel,
                            updateCallback: () => setState(() {}),
                            child: TreeniLiikeFormWidget(
                              luotavaRutiini: _model.luotavaRutiini,
                              liike: _model.luotavaLiike,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

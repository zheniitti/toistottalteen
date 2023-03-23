import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tilastot_sivu_model.dart';
export 'tilastot_sivu_model.dart';

class TilastotSivuWidget extends StatefulWidget {
  const TilastotSivuWidget({Key? key}) : super(key: key);

  @override
  _TilastotSivuWidgetState createState() => _TilastotSivuWidgetState();
}

class _TilastotSivuWidgetState extends State<TilastotSivuWidget> {
  late TilastotSivuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TilastotSivuModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'tilastot_sivu'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          FFLocalizations.of(context).getText(
            'jxhd0x84' /* Analytiikka */,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: Color(0xFFDADADA),
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: StreamBuilder<List<TreeniSessiotRecord>>(
                      stream: queryTreeniSessiotRecord(
                        queryBuilder: (treeniSessiotRecord) =>
                            treeniSessiotRecord
                                .where('userRef',
                                    isEqualTo: currentUserReference)
                                .orderBy('treeniRutiiniData.nimi'),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCircle(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<TreeniSessiotRecord>
                            dropDownTreeniSessiotRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final dropDownTreeniSessiotRecord =
                            dropDownTreeniSessiotRecordList.isNotEmpty
                                ? dropDownTreeniSessiotRecordList.first
                                : null;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownController ??=
                              FormFieldController<String>(null),
                          options: <String>[],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 180.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '3w46zho5' /* Please select... */,
                          ),
                          fillColor: Colors.white,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        );
                      },
                    ),
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

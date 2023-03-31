import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'actions_to_copy_model.dart';
export 'actions_to_copy_model.dart';

class ActionsToCopyWidget extends StatefulWidget {
  const ActionsToCopyWidget({Key? key}) : super(key: key);

  @override
  _ActionsToCopyWidgetState createState() => _ActionsToCopyWidgetState();
}

class _ActionsToCopyWidgetState extends State<ActionsToCopyWidget> {
  late ActionsToCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsToCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'actionsToCopy'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('ACTIONS_TO_COPY_arrow_back_rounded_ICN_O');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '0r18smyh' /* Page Title */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'ACTIONS_TO_COPY_Text_sf0i73vi_ON_TAP');
                          logFirebaseEvent('Text_show_snack_bar');
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  fiText: '🙁 Tämä toiminto ei toimi vielä...',
                                  enText: '🙁This function doesn\'t work yet',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFFE00000),
                            ),
                          );
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'dgt4ezk1' /* showSnackbar
🙁 tämä toiminto ... */
                            ,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '2f5jkjle' /* updateRutiini nimi */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

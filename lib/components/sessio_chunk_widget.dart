import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sessio/sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sessio_chunk_model.dart';
export 'sessio_chunk_model.dart';

class SessioChunkWidget extends StatefulWidget {
  const SessioChunkWidget({
    Key? key,
    this.previousLastDateTime,
    int? indexInList,
  })  : this.indexInList = indexInList ?? 0,
        super(key: key);

  final DateTime? previousLastDateTime;
  final int indexInList;

  @override
  _SessioChunkWidgetState createState() => _SessioChunkWidgetState();
}

class _SessioChunkWidgetState extends State<SessioChunkWidget> {
  late SessioChunkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessioChunkModel());

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

    return StreamBuilder<List<TreeniSessiotRecord>>(
      stream: queryTreeniSessiotRecord(
        queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
            .where('userRef', isEqualTo: currentUserReference)
            .where('alku', isLessThan: widget.previousLastDateTime)
            .orderBy('alku', descending: true),
        limit: 10,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<TreeniSessiotRecord> containerTreeniSessiotRecordList =
            snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.indexInList == 0
                  ? (containerTreeniSessiotRecordList.length == 0)
                  : false)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ynavrwwp' /* Tämä sivu on tyhjä koska sinul... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              Builder(
                builder: (context) {
                  final sessio = functions
                      .filterSessioList(
                          containerTreeniSessiotRecordList.toList(),
                          FFAppState().searchbarText,
                          FFAppState().navBarIndex)
                      .toList();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(sessio.length, (sessioIndex) {
                      final sessioItem = sessio[sessioIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: wrapWithModel(
                          model: _model.sessioModels.getModel(
                            sessioItem.reference.id,
                            sessioIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: SessioWidget(
                            key: Key(
                              'Keyds7_${sessioItem.reference.id}',
                            ),
                            treeniSessio: sessioItem,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              if ((widget.indexInList ==
                      functions.addNumberTo(
                          -1,
                          FFAppState()
                              .sessioChunkListLastItemDateTime
                              .length)) &&
                  (containerTreeniSessiotRecordList.length == 10))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'SESSIO_CHUNK_COMP_Text_qh7abvfe_ON_TAP');
                      logFirebaseEvent('Text_update_app_state');
                      FFAppState().update(() {
                        FFAppState().addToSessioChunkListLastItemDateTime(
                            containerTreeniSessiotRecordList.last.alku!);
                      });
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5smr29rj' /* Näytä lisää */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

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
import 'sessio_chunk_list_model.dart';
export 'sessio_chunk_list_model.dart';

class SessioChunkListWidget extends StatefulWidget {
  const SessioChunkListWidget({
    Key? key,
    this.previousLastDateTime,
    int? indexInList,
  })  : this.indexInList = indexInList ?? 0,
        super(key: key);

  final DateTime? previousLastDateTime;
  final int indexInList;

  @override
  _SessioChunkListWidgetState createState() => _SessioChunkListWidgetState();
}

class _SessioChunkListWidgetState extends State<SessioChunkListWidget> {
  late SessioChunkListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessioChunkListModel());

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
        limit: 20,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final sessio = containerTreeniSessiotRecordList.toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(sessio.length, (sessioIndex) {
                        final sessioItem = sessio[sessioIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
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
              ),
              if ((widget.indexInList ==
                      functions.addNumberTo(
                          -1,
                          FFAppState()
                              .sessioChunkListLastItemDateTime
                              .length)) &&
                  (containerTreeniSessiotRecordList.length == 20))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'SESSIO_CHUNK_LIST_Text_qh7abvfe_ON_TAP');
                      logFirebaseEvent('Text_update_app_state');
                      _model.updatePage(() {
                        FFAppState().addToSessioChunkListLastItemDateTime(
                            containerTreeniSessiotRecordList.last.alku!);
                      });
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5smr29rj' /* Näytä lisää */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
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

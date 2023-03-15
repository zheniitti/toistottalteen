import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_aloita_treenaaminen/button_aloita_treenaaminen_widget.dart';
import '/components/button_luo_rutiini/button_luo_rutiini_widget.dart';
import '/components/sessio/sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'sivu_treeni_historia_komponentti_model.dart';
export 'sivu_treeni_historia_komponentti_model.dart';

class SivuTreeniHistoriaKomponenttiWidget extends StatefulWidget {
  const SivuTreeniHistoriaKomponenttiWidget({Key? key}) : super(key: key);

  @override
  _SivuTreeniHistoriaKomponenttiWidgetState createState() =>
      _SivuTreeniHistoriaKomponenttiWidgetState();
}

class _SivuTreeniHistoriaKomponenttiWidgetState
    extends State<SivuTreeniHistoriaKomponenttiWidget> {
  late SivuTreeniHistoriaKomponenttiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SivuTreeniHistoriaKomponenttiModel());

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
            .orderBy('alku'),
        limit: 1,
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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 150.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (false)
                                Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'clxdf658' /* heatmap calendar
(tulossa) */
                                        ,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              if (containerTreeniSessiotRecordList.length >= 1)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: PagedListView<
                                      DocumentSnapshot<Object?>?,
                                      TreeniSessiotRecord>(
                                    pagingController: () {
                                      final Query<Object?> Function(
                                              Query<Object?>) queryBuilder =
                                          (treeniSessiotRecord) =>
                                              treeniSessiotRecord
                                                  .where('userRef',
                                                      isEqualTo:
                                                          currentUserReference)
                                                  .orderBy('alku',
                                                      descending: true);
                                      if (_model.pagingController != null) {
                                        final query = queryBuilder(
                                            TreeniSessiotRecord.collection);
                                        if (query != _model.pagingQuery) {
                                          // The query has changed
                                          _model.pagingQuery = query;
                                          _model.streamSubscriptions
                                              .forEach((s) => s?.cancel());
                                          _model.streamSubscriptions.clear();
                                          _model.pagingController!.refresh();
                                        }
                                        return _model.pagingController!;
                                      }

                                      _model.pagingController =
                                          PagingController(firstPageKey: null);
                                      _model.pagingQuery = queryBuilder(
                                          TreeniSessiotRecord.collection);
                                      _model.pagingController!
                                          .addPageRequestListener(
                                              (nextPageMarker) {
                                        queryTreeniSessiotRecordPage(
                                          queryBuilder: (treeniSessiotRecord) =>
                                              treeniSessiotRecord
                                                  .where('userRef',
                                                      isEqualTo:
                                                          currentUserReference)
                                                  .orderBy('alku',
                                                      descending: true),
                                          nextPageMarker: nextPageMarker,
                                          pageSize: 15,
                                          isStream: true,
                                        ).then((page) {
                                          _model.pagingController!.appendPage(
                                            page.data,
                                            page.nextPageMarker,
                                          );
                                          final streamSubscription =
                                              page.dataStream?.listen((data) {
                                            data.forEach((item) {
                                              final itemIndexes = _model
                                                  .pagingController!.itemList!
                                                  .asMap()
                                                  .map((k, v) => MapEntry(
                                                      v.reference.id, k));
                                              final index = itemIndexes[
                                                  item.reference.id];
                                              final items = _model
                                                  .pagingController!.itemList!;
                                              if (index != null) {
                                                items.replaceRange(
                                                    index, index + 1, [item]);
                                                _model.pagingController!
                                                    .itemList = {
                                                  for (var item in items)
                                                    item.reference: item
                                                }.values.toList();
                                              }
                                            });
                                            setState(() {});
                                          });
                                          _model.streamSubscriptions
                                              .add(streamSubscription);
                                        });
                                      });
                                      return _model.pagingController!;
                                    }(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate: PagedChildBuilderDelegate<
                                        TreeniSessiotRecord>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitCircle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50.0,
                                          ),
                                        ),
                                      ),

                                      itemBuilder: (context, _, listViewIndex) {
                                        final listViewTreeniSessiotRecord =
                                            _model.pagingController!
                                                .itemList![listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: SessioWidget(
                                            key: Key(
                                                'Keylwp_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
                                            treeniSessio:
                                                listViewTreeniSessiotRecord,
                                          ),
                                        );
                                      },
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
                if (containerTreeniSessiotRecordList.length == 0)
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 80.0, 0.0, 200.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    22.0, 0.0, 22.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'uur18ydl' /* Tämä sivu on tyhjä koska sinul... */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              if (false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.buttonLuoRutiiniModel,
                                        updateCallback: () => setState(() {}),
                                        child: ButtonLuoRutiiniWidget(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model
                                            .buttonAloitaTreenaaminenModel,
                                        updateCallback: () => setState(() {}),
                                        child: ButtonAloitaTreenaaminenWidget(),
                                      ),
                                    ),
                                  ],
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
        );
      },
    );
  }
}

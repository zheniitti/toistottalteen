import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/sessio/sessio_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'sessio_list_view_model.dart';
export 'sessio_list_view_model.dart';

class SessioListViewWidget extends StatefulWidget {
  const SessioListViewWidget({Key? key}) : super(key: key);

  @override
  _SessioListViewWidgetState createState() => _SessioListViewWidgetState();
}

class _SessioListViewWidgetState extends State<SessioListViewWidget> {
  late SessioListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessioListViewModel());

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

    return PagedListView<DocumentSnapshot<Object?>?, TreeniSessiotRecord>(
      pagingController: () {
        final Query<Object?> Function(Query<Object?>) queryBuilder =
            (treeniSessiotRecord) => treeniSessiotRecord
                .where('userRef', isEqualTo: currentUserReference)
                .orderBy('alku', descending: true);
        if (_model.pagingController != null) {
          final query = queryBuilder(TreeniSessiotRecord.collection);
          if (query != _model.pagingQuery) {
            // The query has changed
            _model.pagingQuery = query;
            _model.streamSubscriptions.forEach((s) => s?.cancel());
            _model.streamSubscriptions.clear();
            _model.pagingController!.refresh();
          }
          return _model.pagingController!;
        }

        _model.pagingController = PagingController(firstPageKey: null);
        _model.pagingQuery = queryBuilder(TreeniSessiotRecord.collection);
        _model.pagingController!.addPageRequestListener((nextPageMarker) {
          queryTreeniSessiotRecordPage(
            queryBuilder: (treeniSessiotRecord) => treeniSessiotRecord
                .where('userRef', isEqualTo: currentUserReference)
                .orderBy('alku', descending: true),
            nextPageMarker: nextPageMarker,
            pageSize: 15,
            isStream: true,
          ).then((page) {
            _model.pagingController!.appendPage(
              page.data,
              page.nextPageMarker,
            );
            final streamSubscription = page.dataStream?.listen((data) {
              data.forEach((item) {
                final itemIndexes = _model.pagingController!.itemList!
                    .asMap()
                    .map((k, v) => MapEntry(v.reference.id, k));
                final index = itemIndexes[item.reference.id];
                final items = _model.pagingController!.itemList!;
                if (index != null) {
                  items.replaceRange(index, index + 1, [item]);
                  _model.pagingController!.itemList = {
                    for (var item in items) item.reference: item
                  }.values.toList();
                }
              });
              setState(() {});
            });
            _model.streamSubscriptions.add(streamSubscription);
          });
        });
        return _model.pagingController!;
      }(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      reverse: false,
      scrollDirection: Axis.vertical,
      builderDelegate: PagedChildBuilderDelegate<TreeniSessiotRecord>(
        // Customize what your widget looks like when it's loading the first page.
        firstPageProgressIndicatorBuilder: (_) => Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitCircle(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),

        itemBuilder: (context, _, listViewIndex) {
          final listViewTreeniSessiotRecord =
              _model.pagingController!.itemList![listViewIndex];
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: SessioWidget(
              key: Key(
                  'Key60w_${listViewIndex}_of_${_model.pagingController!.itemList!.length}'),
              treeniSessio: listViewTreeniSessiotRecord,
            ),
          );
        },
      ),
    );
  }
}

import '/components/sessio_chunk/sessio_chunk_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sessio_chunk_lista_model.dart';
export 'sessio_chunk_lista_model.dart';

class SessioChunkListaWidget extends StatefulWidget {
  const SessioChunkListaWidget({Key? key}) : super(key: key);

  @override
  _SessioChunkListaWidgetState createState() => _SessioChunkListaWidgetState();
}

class _SessioChunkListaWidgetState extends State<SessioChunkListaWidget> {
  late SessioChunkListaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessioChunkListaModel());

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

    return Builder(
      builder: (context) {
        final chunkList = FFAppState().sessioChunkListLastItemDateTime.toList();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(chunkList.length, (chunkListIndex) {
            final chunkListItem = chunkList[chunkListIndex];
            return wrapWithModel(
              model: _model.sessioChuncModels.getModel(
                chunkListIndex.toString(),
                chunkListIndex,
              ),
              updateCallback: () => setState(() {}),
              child: SessioChunkWidget(
                key: Key(
                  'Key6w8_${chunkListIndex.toString()}',
                ),
                indexInList: chunkListIndex,
                previousLastDateTime: chunkListIndex == 0
                    ? getCurrentTimestamp
                    : FFAppState().sessioChunkListLastItemDateTime[
                        functions.addNumberTo(-1, chunkListIndex)],
              ),
            );
          }),
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'feedback_message_model.dart';
export 'feedback_message_model.dart';

class FeedbackMessageWidget extends StatefulWidget {
  const FeedbackMessageWidget({
    Key? key,
    this.feedback,
  }) : super(key: key);

  final FeedbacksRecord? feedback;

  @override
  _FeedbackMessageWidgetState createState() => _FeedbackMessageWidgetState();
}

class _FeedbackMessageWidgetState extends State<FeedbackMessageWidget> {
  late FeedbackMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackMessageModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dateTimeFormat(
                  'relative',
                  widget.feedback!.createdTime!,
                  locale: FFLocalizations.of(context).languageCode,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
              if (widget.feedback!.userRef == currentUserReference)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('FEEDBACK_MESSAGE_Icon_4u9i7zgv_ON_TAP');
                      logFirebaseEvent('Icon_backend_call');
                      await widget.feedback!.reference.delete();
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: FlutterFlowTheme.of(context).deleteRed,
                      size: 24.0,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            widget.feedback!.message!,
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          if (valueOrDefault<bool>(
            widget.feedback!.photoUrls!.toList().length > 0,
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final uploadedPhotos = widget.feedback!.photoUrls!.toList();
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(uploadedPhotos.length,
                          (uploadedPhotosIndex) {
                        final uploadedPhotosItem =
                            uploadedPhotos[uploadedPhotosIndex];
                        return Container(
                          constraints: BoxConstraints(
                            minWidth: 70.0,
                            minHeight: 70.0,
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                            maxHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'FEEDBACK_MESSAGE_Image_dkt57db5_ON_TAP');
                                logFirebaseEvent('Image_expand_image');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: CachedNetworkImage(
                                        imageUrl: uploadedPhotosItem,
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: true,
                                      tag: uploadedPhotosItem,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: uploadedPhotosItem,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CachedNetworkImage(
                                    imageUrl: uploadedPhotosItem,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          Divider(
            height: 22.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ],
      ),
    );
  }
}

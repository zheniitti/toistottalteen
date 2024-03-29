import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/feedback_message_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'feedback_page_model.dart';
export 'feedback_page_model.dart';

class FeedbackPageWidget extends StatefulWidget {
  const FeedbackPageWidget({Key? key}) : super(key: key);

  @override
  _FeedbackPageWidgetState createState() => _FeedbackPageWidgetState();
}

class _FeedbackPageWidgetState extends State<FeedbackPageWidget> {
  late FeedbackPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FeedbackPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FEEDBACK_FeedbackPage_ON_INIT_STATE');
      logFirebaseEvent('FeedbackPage_update_widget_state');
      _model.pageOpenTime = getCurrentTimestamp;
    });

    _model.feedbackMessageController ??= TextEditingController();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              '69s07yb4' /* Palautteet */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondary,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<FeedbacksRecord>>(
                      stream: queryFeedbacksRecord(
                        queryBuilder: (feedbacksRecord) => feedbacksRecord
                            .orderBy('createdTime', descending: true),
                        limit: 30,
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
                        List<FeedbacksRecord> listViewFeedbacksRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          reverse: true,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewFeedbacksRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewFeedbacksRecord =
                                listViewFeedbacksRecordList[listViewIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FeedbackMessageWidget(
                                key: Key(
                                    'Key872_${listViewIndex}_of_${listViewFeedbacksRecordList.length}'),
                                feedback: listViewFeedbacksRecord,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.uploadedFileUrls.length > 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final uploadedPhotos = _model
                                                      .uploadedFileUrls
                                                      .toList();
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          uploadedPhotos.length,
                                                          (uploadedPhotosIndex) {
                                                        final uploadedPhotosItem =
                                                            uploadedPhotos[
                                                                uploadedPhotosIndex];
                                                        return Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FEEDBACK_PAGE_PAGE_Image_yr6znkar_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Image_expand_image');
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          uploadedPhotosItem,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            true,
                                                                        tag:
                                                                            uploadedPhotosItem,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      uploadedPhotosItem,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    child: Image
                                                                        .network(
                                                                      uploadedPhotosItem,
                                                                      width:
                                                                          70.0,
                                                                      height:
                                                                          50.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'FEEDBACK_PAGE_PAGE_Icon_w55w9f5k_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_delete_data');
                                                                  await FirebaseStorage
                                                                      .instance
                                                                      .refFromURL(
                                                                          uploadedPhotosItem)
                                                                      .delete();
                                                                },
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .deleteRed,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                              if (false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                          Color(0x00FFFFFF)
                                                        ],
                                                        stops: [0.5, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                -1.0, 0),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            Color(0xFFFF5963),
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'FEEDBACK_delete_outline_ICN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'IconButton_clear_uploaded_data');
                                                        setState(() {
                                                          _model.isDataUploading =
                                                              false;
                                                          _model.uploadedLocalFiles =
                                                              [];
                                                          _model.uploadedFileUrls =
                                                              [];
                                                        });
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 16.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (_model.uploadedFileUrls.length == 0)
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 8.0,
                                          borderWidth: 1.0,
                                          buttonSize: 44.0,
                                          icon: Icon(
                                            Icons.add_photo_alternate,
                                            color: Color(0xFF57636C),
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'FEEDBACK_add_photo_alternate_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_upload_media_to_firebase');
                                            final selectedMedia =
                                                await selectMedia(
                                              maxWidth: 3000.00,
                                              maxHeight: 3000.00,
                                              imageQuality: 100,
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              var downloadUrls = <String>[];
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isDataUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFiles =
                                                      selectedUploadedFiles;
                                                  _model.uploadedFileUrls =
                                                      downloadUrls;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                setState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload data');
                                                return;
                                              }
                                            }
                                          },
                                        ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                            controller: _model
                                                .feedbackMessageController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'm26op9sp' /* Kirjoita tähän... */,
                                              ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          20.0, 24.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF101213),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            maxLines: 10,
                                            minLines: 1,
                                            validator: _model
                                                .feedbackMessageControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FEEDBACK_PAGE_PAGE_Row_ymmjksk0_ON_TAP');
                                            if ((_model.isDataUploading ==
                                                    false) &&
                                                (_model.feedbackMessageController
                                                            .text !=
                                                        null &&
                                                    _model.feedbackMessageController
                                                            .text !=
                                                        '')) {
                                              logFirebaseEvent(
                                                  'Row_backend_call');

                                              final feedbacksCreateData = {
                                                ...createFeedbacksRecordData(
                                                  userRef: currentUserReference,
                                                  message: _model
                                                      .feedbackMessageController
                                                      .text,
                                                ),
                                                'createdTime': FieldValue
                                                    .serverTimestamp(),
                                                'photoUrls':
                                                    _model.uploadedFileUrls,
                                              };
                                              await FeedbacksRecord.collection
                                                  .doc()
                                                  .set(feedbacksCreateData);
                                              logFirebaseEvent(
                                                  'Row_clear_text_fields');
                                              setState(() {
                                                _model.feedbackMessageController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Row_clear_uploaded_data');
                                              setState(() {
                                                _model.isDataUploading = false;
                                                _model.uploadedLocalFiles = [];
                                                _model.uploadedFileUrls = [];
                                              });
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g8jwin03' /* Lähetä */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF39D2C0),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.send_rounded,
                                                color: Color(0xFF39D2C0),
                                                size: 28.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

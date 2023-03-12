// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../auth/auth_util.dart';

Future myUpdateSarjaAtIndex(
  int sarjaIndex,
  int liikeIndex,
  TreeniRutiiniStruct? treeniRutiini,
  int? toistoMaara,
  double? painoKg,
) async {
  if (treeniRutiini == null || treeniRutiini.createdTime == null) return;

  final int rutiiniIndex = currentUserDocument!.treeniRutiinit!.indexWhere(
      (rutiini) => rutiini.createdTime! == treeniRutiini?.createdTime);
  List<Map<String, dynamic>> rutiinitListaFirestoreData =
      getTreeniRutiiniListFirestoreData(
          currentUserDocument?.treeniRutiinit?.toList() ?? []);
  if (rutiinitListaFirestoreData.isEmpty) return;
  Map<String, dynamic> rutiiniFirestoreData =
      rutiinitListaFirestoreData[rutiiniIndex];
  List<LiikeStruct> liikkeet = treeniRutiini?.liikkeet?.toList() ?? [];
  Map<String, dynamic> liikeFirestoreData =
      getLiikeFirestoreData(liikkeet[liikeIndex]);
  List<SarjaStruct> sarjat =
      treeniRutiini?.liikkeet?[liikeIndex]?.sarjat?.toList() ?? [];
  Map<String, dynamic> sarjaFirestoreData =
      getLiikeFirestoreData(liikkeet[liikeIndex]);

  sarjaFirestoreData['toistoMaara'] =
      toistoMaara ?? sarjaFirestoreData['toistoMaara'];
  sarjaFirestoreData['painoKg'] = painoKg ?? sarjaFirestoreData['painoKg'];

  liikeFirestoreData['sarjat'][sarjaIndex] = sarjaFirestoreData;
  rutiiniFirestoreData['liikkeet'][liikeIndex] = liikeFirestoreData;
  rutiinitListaFirestoreData[rutiiniIndex] = rutiiniFirestoreData;
  await currentUserReference!
      .update({'treeniRutiinit': rutiinitListaFirestoreData});
}

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

Future updateUserDocRutiiniValitutPaivat(
  TreeniRutiiniStruct? rutiini,
  bool? toggleMa,
  bool? toggleTi,
  bool? toggleKe,
  bool? toggleTo,
  bool? togglePe,
  bool? toggleLa,
  bool? toggleSu,
) async {
  if (rutiini == null || rutiini.createdTime == null) return;

  try {
    final int rutiiniIndex = currentUserDocument!.treeniRutiinit!
        .indexWhere((rutiini) => rutiini.createdTime! == rutiini?.createdTime);
    List<Map<String, dynamic>> rutiinitListaFirestoreData =
        getTreeniRutiiniListFirestoreData(
            currentUserDocument?.treeniRutiinit?.toList() ?? []);
    if (rutiinitListaFirestoreData.isEmpty) return;

    Map<String, dynamic> rutiiniFirestoreData =
        rutiinitListaFirestoreData[rutiiniIndex];
    Map<String, dynamic> valitutViikonPaivat =
        rutiiniFirestoreData['valitutPaivat'] ?? {};
    valitutViikonPaivat['ma'] = toggleMa ?? !valitutViikonPaivat['ma'];
    valitutViikonPaivat['ti'] = toggleTi ?? !valitutViikonPaivat['ti'];
    valitutViikonPaivat['ke'] = toggleKe ?? !valitutViikonPaivat['ke'];
    valitutViikonPaivat['to'] = toggleTo ?? !valitutViikonPaivat['to'];
    valitutViikonPaivat['pe'] = togglePe ?? !valitutViikonPaivat['pe'];
    valitutViikonPaivat['la'] = toggleLa ?? !valitutViikonPaivat['la'];
    valitutViikonPaivat['su'] = toggleSu ?? !valitutViikonPaivat['su'];

    rutiiniFirestoreData['valitutPaivat'] = valitutViikonPaivat;
    rutiinitListaFirestoreData[rutiiniIndex] = rutiiniFirestoreData;
    await currentUserReference!
        .update({'treeniRutiinit': rutiinitListaFirestoreData});
  } on Exception catch (e) {
    print('Error updating rutiinin valitut paivat: $e');
  }
}
